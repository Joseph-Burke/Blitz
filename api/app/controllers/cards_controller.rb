class CardsController < ApplicationController
  before_action :set_card, :set_anki_client, only: :create

  def create
    AnkiConnectClient.create_card(@card)
  end

  private

  def card_params
    params.fetch(:card, {})
  end

  def set_card
    @card = Card.new(card_params)
  end
  
  def set_anki_client
    @anki_client = AnkiConnectClient.create_card(@card)
  end
end
