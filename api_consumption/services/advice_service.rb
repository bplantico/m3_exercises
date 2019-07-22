require 'faraday'
require 'json'

class AdviceService
  def random
    get_json('/advice')
  end

  def find(query)
    get_json("/advice/#{query}")
  end

  def search(query)
    get_json("advice/search/#{query}")
  end

  private

  def get_json(url, params = {})
    response = conn.get(url, params)

    JSON.parse(response.body)
  end

  def conn
    Faraday.new(url: 'https://api.adviceslip.com') do |f|
      f.adapter Faraday.default_adapter
    end
  end
end
