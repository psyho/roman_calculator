require 'spec_helper'

describe RomanNumeral do
  it "sums I + I to II" do
    expect('I'.to_roman + 'I'.to_roman).to eq('II'.to_roman)
  end
end
