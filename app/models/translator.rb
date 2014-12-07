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
      Filters::ReverseWords.new.apply(input)
    end
  end
end
