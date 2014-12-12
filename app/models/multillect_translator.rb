require 'faraday_middleware'


TWO_TO_THREE_CODES={ ru: 'rus', en: 'eng', ar: 'ara', fr: 'fra', de: 'deu', es: 'spa', tr: 'tur', uk: 'ukr' }

class MultillectTranslator

  def translate(from_lang, to_lang, input)

    from_lang_three = two_code_to_three_code from_lang
    to_lang_three = two_code_to_three_code to_lang

    param_hash = {
      method: 'translate/api/translate',
      sig: 'ed6c2682a2eeb57989d9ce1fc8732c93',
      # sig: '9c7dd4236b1d38f2b8151a6fe139708d', # sarah's multilect key for emergency use
      from: from_lang_three,
      to: to_lang_three,
      text: input
    }

    conn = Faraday.new "http://api.multillect.com" do |faraday|
      faraday.response :json
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("/translate/json/1.0/36", param_hash)
    raise ("Error: #{response.body}") if response.status != 200

    response.body['result']['translated'].strip
  end

  def two_code_to_three_code(two_code)
    TWO_TO_THREE_CODES[two_code.to_sym] || raise("#{two_code} is an unsupported language.")
  end

end
