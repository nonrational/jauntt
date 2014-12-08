require 'filters'

class Translator
  attr_reader :from, :to

  def initialize(from, to)
    @from = from
    @to = to
  end

  def translate(input)
    if from == to
      input.start_with?("###") ? Filters::ObfuscateUnicode.new.apply(input[3..-1]).strip : input
    else
      output = MultillectTranslator.new.translate(from, to, input)
      input.start_with?("###") ? Filters::ObfuscateUnicode.new.apply(output[3..-1]).strip : output
    end
  end
end
