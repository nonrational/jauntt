class Filters::ObfuscateUnicode

  def apply(input)
    response = Faraday.get "https://bheithaus-unicode-obfuscator.p.mashape.com/obfuscate?level=3&word=#{input}" do |req|
      req.headers["X-Mashape-Key"] = "rjmfOTqpp1mshxOBL4QtN6J1EOjpp11UQSnjsnN9f5K3slENR6"
    end
    JSON.parse(response.body)['obfuscation']
  end

end
