class CardsController < ApplicationController
  before_action :set_card, :set_anki_client, only: :create

  def create
    # use the incoming data to create a card
    # that will depend on what data arrives
    
    # One piece of functionality that gets an image
    # One piece of functionality that gets an audio recording
    # One piece of functionality that gets an ipa transcription
    result = @anki_client.post_card

    render json: { result: result }, status: result ? :created : :unprocessable_entity
  end

  private

  def card_params
    params.fetch(:card, {}).permit(:cardType, :type, :text, :rule, :example)
  end

  def set_card
    @card = Card.new(
      template: card_type,
      parameters: card_params.to_h
    )
  end
  
  def set_anki_client
    @anki_client = AnkiConnectClient.new(card: @card)
  end

  def card_type
    params[:card_type]
  end
end
