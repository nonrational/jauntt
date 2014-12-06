class Filters::ReverseLetters
  def apply(input)
    input.split(/\s+/).map { |word| word.split("").reverse.join("") }.join(' ')
  end
end
