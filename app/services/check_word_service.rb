class CheckWordService
  attr_accessor :word

  def self.call(word:)
    new(word)
  end

  def initialize(word)
    @word = word
  end

  def valid?
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'mashape-community-urban-dictionary.p.rapidapi.com'
    request["x-rapidapi-key"] = '28b2e64f23mshad6bd563cf37710p119064jsn5f7e910fb223'
    response = http.request(request)
    response_body = JSON.parse(response.read_body)
    response_body['list'].count.positive?
  end

  private

  def url
    URI("https://mashape-community-urban-dictionary.p.rapidapi.com/define?term=#{@word}")
  end
end
