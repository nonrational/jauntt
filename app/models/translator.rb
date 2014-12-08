class Translator
  attr_reader :from, :to

  def initialize(from, to)
    @from = from
    @to = to
  end

  def translate(input)
    if from == to
      input
    else
      require 'filters'
      MultillectTranslator.new.translate(from, to, input)
    end
  end
end
