# Defines a connection with the external API
class Connection
  require 'faraday_middleware'

  APPLICATION_TOKEN = ENV['APPLICATION_TOKEN']
  TIMEOUT = 110
  OPEN_TIMEOUT = 10

  def call(url, token)
    Faraday.new(url: url) do |c|
      c.response :json, content_type: 'application/json'
      c.request :json
      c.options.timeout = TIMEOUT
      c.options.open_timeout = OPEN_TIMEOUT
      c.headers['Authorization'] = "Bearer #{token}"
      c.response :json, parser_options: { symbolize_names: true }
      c.adapter Faraday.default_adapter
    end
  end
end
