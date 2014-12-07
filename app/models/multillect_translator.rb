class MultillectTranslator

  def translate(from_lang, to_lang, input)

    from_lang_three = two_code_to_three_code from_lang
    to_lang_three = two_code_to_three_code to_lang

    id=36
    sig='ed6c2682a2eeb57989d9ce1fc8732c93'
    format='json'
    lang_from="eng"
    lang_to="spa"

    url = "http://api.multillect.com/translate/#{format}/1.0/#{id}?method=translate/api/translate&from=#{lang_from}&to=#{lang_to}&text=#{input}&sig=#{sig}"
    resp = Faraday.get url
    JSON.parse(resp.body)['result']['translated'].strip
  end

  def two_code_to_three_code(two_code)
    three_code = { ru: 'rus', en: 'eng', ar: 'ara', fr: 'fra', de: 'deu', sp: 'spa', tr: 'tur', uk: 'ukr' }[two_code.to_sym]

    if !three_code
      raise "#{two_code} is an unsupported language. found '#{three_code}'"
    else
      three_code
    end
  end

end
