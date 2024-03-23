class AnkiConnectClient
  include HTTParty
  attr_accessor :card
  
  VERSION = 6

  # The base URI for AnkiConnect
  base_uri 'http://localhost:8765/'
  
  # Make HTTParty methods available to instances of AnkiConnectClient
  delegate :post, to: :class

  def initialize(card:)
    @card = card
  end

  def post_card
    post '', body: body('addNote').to_json, headers: headers
  end

  private

  def body action
    {
      "action": action,
      "version": VERSION,
      "params": {
        "note": {
          "deckName": @card.deck_name,
          "modelName": @card.template,
          "fields": @card.fields,
          "options": @card.options
        }
      }
    }
  end

  def headers
    { 'Content-Type' => 'application/json' }
  end
end
