require 'HTTParty'
require 'openai'
require 'dotenv'
require 'byebug'

Dotenv.load

def get_speech_audio text=''
  api_key = ENV['OPEN_AI_API_KEY']
  client = OpenAI::Client.new(access_token: api_key)
  voice = %w[alloy echo fable onyx nova shimmer].sample

  response = client.audio.speech(
    parameters: {
      model: "tts-1",
      input: text,
      voice: voice
    }
  )
  
  File.binwrite("#{Time.now.to_i}audio.mp3", response)
end
