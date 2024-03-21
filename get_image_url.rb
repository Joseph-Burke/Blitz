require 'HTTParty'
require 'openai'
require 'dotenv'
require 'byebug'

Dotenv.load

def get_image_url text=''
  api_key = ENV['OPEN_AI_API_KEY']
  client = OpenAI::Client.new(access_token: api_key)

  response = client.images.generate(
    parameters: {
      prompt: text,
      size: "256x256"
    }
  )

  response.dig('data', 0, 'url')
end
