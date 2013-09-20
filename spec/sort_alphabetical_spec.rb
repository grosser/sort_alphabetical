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
    pending do
      %w(asb aßc asd).sort_alphabetical.should == %w(asb aßc asd)
    end
  end

  it "sorts ˇ" do
    ["ˇ"].sort_alphabetical.should == ["ˇ"]
  end

  describe :normalize do
    context 'fr' do
      it "saves only letters, separators, punctuations and numbers" do
        before = 'Samoa américaines, MÃller Street, 125¼'
        after  = 'Samoa americaines, MAller Street, 12514'

        SortAlphabetical.normalize(before).should == after
      end
    end

    context 'ru' do
      it "saves only letters, separators, punctuations and numbers" do
        before = 'Амереканское Самоа, ул. Мёллер, 125¼'
        after  = 'Амереканское Самоа, ул. Меллер, 12514'

        SortAlphabetical.normalize(before).should == after
      end
    end
  end

  describe "sorting countries" do
    context "en" do
      it "should sort countries in right order" do
        ['Ukraine', 'Jamaica', 'American Samoa'].sort_alphabetical.should == ['American Samoa', 'Jamaica', 'Ukraine']
      end
    end

    context "ru" do
      it "should sort countries in right order" do
        ['Ямайка', 'Украина', 'Американское Самоа'].sort_alphabetical.should == ['Американское Самоа', 'Украина', 'Ямайка']
      end
    end

    context "fr" do
      it "should sort countries in right order" do
        ['Ukraine', 'Samoa américaines', 'Jamaïque'].sort_alphabetical.should == ['Jamaïque', 'Samoa américaines', 'Ukraine']
      end
    end
  end

  describe :sort_alphabetical_by do
    it "sorts using given block" do
      %w(za yá xä xa).sort_alphabetical_by{|x|x.chars.to_a.reverse.join}.should == %w(xa xä yá za)
    end

    it "sorts arrays" do
      [
        ["B", "A"],
        ["A", "B"],
      ].sort_alphabetical_by{|x| x }.should == [
        ["A", "B"],
        ["B", "A"]
      ]
    end
  end
end
