require File.expand_path("spec_helper", File.dirname(__FILE__))

describe SortAlphabetical do
  it "sorts ascii correctly" do
    %w(b c a).sort_alphabetical.should == %w(a b c)
  end
end