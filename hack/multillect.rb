#!/usr/bin/env ruby
require 'faraday'
require 'json'

# """
# rus — Russian
# eng — English
# ara — Arabic
# fra — French
# deu — German
# spa — Spanish
# tur — Turkish
# ukr — Ukrainian
# """

input="hi"

format='json'
id=36
lang_from="eng"
lang_to="spa"
sig='ed6c2682a2eeb57989d9ce1fc8732c93'

url = "http://api.multillect.com/translate/#{format}/1.0/#{id}?method=translate/api/translate&from=#{lang_from}&to=#{lang_to}&text=#{input}&sig=#{sig}"
p url
r = Faraday.get url
p JSON.parse(r.body)
