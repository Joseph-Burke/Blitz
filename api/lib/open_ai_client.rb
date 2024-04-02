class OpenAiClient
  def initialize
    api_key = ENV['OPEN_AI_API_KEY']
    @client = OpenAI::Client.new(access_token: api_key)
  end

  # Takes text and returns a generated image URL
  def get_image_url(text)
    raise ArgumentError, "Text parameter is required" if text.blank?

    response = @client.images.generate(
      parameters: {
        prompt: text,
        size: "256x256"
      }
    )

    response.dig('data', 0, 'url')
  end

  # Takes text and returns a file name of the generated speech audio
  def get_speech_audio_from_text(text)
    random_voice = %w[alloy echo fable onyx nova shimmer].sample
    response = @client.audio.speech(
      parameters: {
        model: "tts-1",
        input: text,
        voice: random_voice,
        speed: rand(0.8..1.0).round(1)
      }
    )
    
    file_name = "tmp/speech_files/#{Time.now.to_i}.mp3"
    File.binwrite(file_name, response)

    file_name
  end
end
