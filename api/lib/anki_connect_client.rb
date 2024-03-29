# The AnkiConnectClient class is responsible for interacting with AnkiConnect API
class AnkiConnectClient
  include HTTParty
  
  VERSION = 6

  # The base URI for AnkiConnect
  base_uri 'http://localhost:8765/'
  
  # Make HTTParty methods available to instances of AnkiConnectClient
  delegate :post, to: :class

  # Initializes a new instance of AnkiConnectClient with a card object
  #
  # @param card [Card] The card object to be posted to Anki
  def initialize(card:)
    @card = card
    @data = DataService.new(card).convert_to_anki_data
  end

  # Posts the card to Anki using the AnkiConnect API
  #
  # @return [Hash] The response from the API
  def post_card
    response = post '', body: body.to_json, headers: headers

    response['result'] || debugger
  end

  private

  # Builds the request body for the specified action
  #
  # @param action [String] The action to be performed
  # @return [Hash] The request body
  def body
    {
      "action": 'addNote',
      "version": 6,
      "params": {
        "note": {
            "deckName": @data[:deck_name],
            "modelName": @data[:model_name],
            "fields": @data[:fields],
            "options": @data[:options],
            "picture": @data[:picture],
            "audio": @data[:audio],
            "tags": []
        }
      },
    }
  end

  # Returns the headers for the API request
  #
  # @return [Hash] The headers
  def headers
    { 'Content-Type' => 'application/json' }
  end
end
