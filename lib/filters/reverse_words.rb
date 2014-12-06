class Filters::ReverseWords
  def apply(input)
    input.split(/\s+/).reverse.join(' ')
  end
end
