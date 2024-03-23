class CardsController < ApplicationController
  before_action :set_card, :set_anki_client, only: :create

  def create
    # use the incoming data to create a card
    # that will depend on what data arrives
    
    # One piece of functionality that gets an image
    # One piece of functionality that gets an audio recording
    # One piece of functionality that gets an ipa transcription
    @anki_client.post_card
  end

  private

  def card_params
    params.fetch(:card, {})
  end

  def set_card
    @card = Card.new(card_params)
  end
  
  def set_anki_client
    @anki_client = AnkiConnectClient.new(card: @card)
  end
end
