require 'rubygems'
require 'active_support'
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
    if defined? ActiveSupport::Multibyte::Handlers #pre ActiveSupport 2.3
      ActiveSupport::Multibyte::Handlers::UTF8Handler.normalize(string,:d).split(//u)
    else
      string.mb_chars.normalize(:d).split(//u)
    end
  end
end