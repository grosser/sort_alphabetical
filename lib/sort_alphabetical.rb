# TODO do something like with_utf8 do ...
$KCODE = 'UTF8' # otherwise mb_chars produces normal strings

require 'active_support/version'
if ActiveSupport::VERSION::MAJOR > 2
  # pick what we need
  require 'active_support/core_ext/string/multibyte'
else
  # load everything, its a mess in there ...
  require 'active_support'
end
require 'sort_alphabetical/core_ext'

module SortAlphabetical
  extend self

  def sort(set)
    set.sort_by do |item|
      if block_given?
        item = yield(item).to_s
      else
        item = item.to_s
      end
      [to_ascii(item),item]#when both á and a are present, sort them a, á
    end
  end

  def to_ascii(string)
    split_codepoints(string).map(&:to_s).reject{|e| e.length > 1}.join
  end

  private

  # returns an array of unicode codepoints, in canonical order
  def split_codepoints(string)
    string.mb_chars.normalize(:d).split(//u)
  end
end
