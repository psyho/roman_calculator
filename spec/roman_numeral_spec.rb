require 'spec_helper'

describe RomanNumeral do
  it "converts I to 1" do
    "I".to_roman.to_i.should == 1
  end
end
