class CardsController < ApplicationController
  # GET /cards/new
  def new
    @card = Card.new
  end

  # POST /cards or /cards.json
  def create
    @card = Card.new(card_params)
  end

  private
    # Only allow a list of trusted parameters through.
    def card_params
      params.fetch(:card, {})
    end
end
