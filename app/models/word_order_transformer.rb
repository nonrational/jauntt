class WordOrderTransformer

  def transform(string)
    string.split(/\s/).reverse.join(' ')
  end

  alias_method :encode, :transform
  alias_method :decode, :transform

end
