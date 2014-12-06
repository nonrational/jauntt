require 'rails_helper'

describe WordOrderTransformer do

  it 'reverses empty lists as a noop' do
    expect(WordOrderTransformer.new.transform("")).to eq ""
  end

end
