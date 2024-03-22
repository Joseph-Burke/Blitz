class CardsController < ApplicationController
  def create
    AnkiConnectClient.create_card
  end

  private

  def card_params
    params.fetch(:card, {})
  end
end
