class AnkiConnectClient
  include HTTParty
  attr_accessor :card

  base_uri 'http://localhost:8765/'
  
  VERSION = 6

  def initialize
    @card |= Card.new
  end

  def post_card
    post '', body: body('addNote'), headers: HEADERS
  end
    
  private
    
  def body action
    {
      "action": action,
      "version": VERSION,
      "params": {
        "note": {
          "deckName": @card.deck_name,
          "modelName": @card.model_name,
          "fields": @card.fields,
          "options": @card.options
        }
      }
    }.to_json
  end

  def headers
    { 'Content-Type' => 'application/json' }
  end
end
