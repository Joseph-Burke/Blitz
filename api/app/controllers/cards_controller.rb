class CardsController < ApplicationController
  def create
    AnkiConnectClient.create_card
  end
end
