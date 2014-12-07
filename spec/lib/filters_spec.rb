require 'rails_helper'
require 'filters'

describe Filters::ReverseWords do

  let(:reverser) { Filters::ReverseWords.new }

  it 'reverses empty lists as a noop' do
    expect(reverser.apply("")).to eq ""
  end

  it 'reverses a list of words correctly' do
    expect(reverser.apply("hi there world")).to eq "world there hi"
  end

end

describe Filters::ObfuscateUnicode do

  let(:obfuscater) { Filters::ObfuscateUnicode.new }

  it 'obfuscates plain ascii message' do
    expect(obfuscater.apply("plain ol' ascii")).to eq "ᖗᒹᗨ༆ក ្ᒹ' ᗨៜᓛ༆༆"
  end
end
