require 'rails_helper'

describe MultillectTranslator do

  let(:translator) { MultillectTranslator.new }

  it 'can use hashes' do
    code = 'en'
    expect({en: "english"}[:en]).to eq("english")
  end

  it 'can speak spanish' do
    expect(translator.translate("en", "sp", "hi")).to eq "hola"
  end

  it "can't speak latin" do
    expect { translator.translate("en", "la", "hi") }.to raise_error(RuntimeError)
  end
end
