# -*- encoding: utf-8 -*-
require 'spec_helper'

describe "SortAlphabetical"do
  it "sorts ascii correctly" do
    %w(b c a).sort_alphabetical.should == %w(a b c)
  end

  it "sorts UTF8 chars without accents" do
    %w(b a á ä o ó x ö í i c).sort_alphabetical.should == %w(a á ä b c i í o ó ö x)
  end

  it "sorts by merging base with accented" do
    %w(AA AB ÄA).sort_alphabetical.should == %w(AA ÄA AB)
  end

  it "sorts words" do
    %w(hellö hello hellá).sort_alphabetical.should == %w(hellá hello hellö)
  end

  it "obeys order for ligatures" do
    pending
    %w(asb aßc asd).sort_alphabetical.should == %w(asb aßc asd)
  end

  describe :to_ascii do
    it "removes any accents" do
      SortAlphabetical.to_ascii('á').should == 'a'
    end
  end

  describe :sort_alphabetical_by do
    it "sorts using given block" do
      silence_warnings do
        %w(za yá xä xa).sort_alphabetical_by{|x|x.chars.to_a.reverse.join}.should == %w(xa xä yá za)
      end
    end
  end
end
