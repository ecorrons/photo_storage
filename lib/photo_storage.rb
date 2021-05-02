# API token handler and renewal, retrieves images from API and saves them in DB (cache)
# Disclaimer: It would be better if this class was a rake task that runs scheduled
class PhotoStorage
  require 'connection'

  API_URL = ENV['API_URL']
  API_TOKEN = ENV['API_TOKEN']
  API_KEY = ENV['API_KEY']

  def all
    if Image.none? || Image.first.expired?
      response = connection.call(API_URL, Token.newest).get('/images')
      # renew token if response is 401 Unauthorized
      response = connection.call(API_URL, auth_token).get('/images') if response.status.equal? 401
      refresh_images(response) if response.success?
    end

    Image.all
  end

  private

  def refresh_images(response)
    Image.delete_all
    response.body[:pageCount].times do |page|
      response.body[:pictures].each do |pic|
        i = Image.new
        i.api_id = pic[:id]
        i.cropped_picture = pic[:cropped_picture]
        meta_fields(i)
        i.save!
      end
      response = connection.call(API_URL, Token.newest).get("/images?page=#{page}")
    end
  end

  def meta_fields(image)
    response = connection.call(API_URL, Token.newest).get("/images/#{image.api_id}")
    if response.success?
      image.author = response.body[:author]
      image.camera = response.body[:camera]
      image.tags = response.body[:tags]
      image.full_picture = response.body[:full_picture]
    end
  end

  def connection
    @connection ||= Connection.new
  end

  def auth_params
    { 'apiKey': API_KEY }
  end

  def auth_token
    response = connection.call(API_URL, API_TOKEN).post('/auth', auth_params)

    return Token.create!(token: response.body[:token]) if response.success?
  end
end
