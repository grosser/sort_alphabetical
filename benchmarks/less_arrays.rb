require "bundler/setup"
require "benchmark/ips"

require 'unicode_utils/compatibility_decomposition'
require 'unicode_utils/general_category'

module SortAlphabetical
  extend self

  def sort(set)
    set.sort_by do |item|
      if block_given?
        item = yield(item).to_s
      else
        item = item.to_s
      end
      [normalize(item), item] # when both á and a are present, sort them a, á
    end
  end

  def normalize(string)
    UnicodeUtils.compatibility_decomposition(string).split(''.freeze).select do |c|
      UnicodeUtils.general_category(c) =~ /Letter|Separator|Punctuation|Number/
    end.join
  end
end

module SortAlphabeticalEachChar
  extend self

  def sort(set)
    set.sort_by do |item|
      if block_given?
        item = yield(item).to_s
      else
        item = item.to_s
      end
      [normalize(item), item] # when both á and a are present, sort them a, á
    end
  end

  def normalize(string)
    result = String.new
    UnicodeUtils.compatibility_decomposition(string).each_char do |c|
      result << c if UnicodeUtils.general_category(c) =~ /Letter|Separator|Punctuation|Number/
    end
    result
  end
end

module SortAlphabeticalEachWithObject
  extend self

  def sort(set)
    set.sort_by do |item|
      if block_given?
        item = yield(item).to_s
      else
        item = item.to_s
      end
      [normalize(item), item] # when both á and a are present, sort them a, á
    end
  end

  def normalize(string)
    UnicodeUtils.compatibility_decomposition(string).each_char.each_with_object(String.new) do |c, result|
      result << c if UnicodeUtils.general_category(c) =~ /Letter|Separator|Punctuation|Number/
    end
  end
end

sample = %w[b a á ä o ó x ö í i c]

Benchmark.ips do |x|
  x.report("regular") { SortAlphabetical.sort(sample) }
  x.report("each_char") { SortAlphabeticalEachChar.sort(sample) }
  x.report("each_with_object") { SortAlphabeticalEachWithObject.sort(sample) }

  x.compare!
end

=begin
Warming up --------------------------------------
             regular   662.000  i/100ms
           each_char     1.247k i/100ms
    each_with_object     1.070k i/100ms
Calculating -------------------------------------
             regular      6.816k (± 3.1%) i/s -     34.424k
           each_char     12.762k (± 2.5%) i/s -     64.844k
    each_with_object     10.842k (± 2.7%) i/s -     54.570k

Comparison:
           each_char:    12762.0 i/s
    each_with_object:    10842.4 i/s - 1.18x slower
             regular:     6816.2 i/s - 1.87x slower
=end
