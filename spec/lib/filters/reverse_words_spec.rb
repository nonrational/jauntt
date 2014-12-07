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
