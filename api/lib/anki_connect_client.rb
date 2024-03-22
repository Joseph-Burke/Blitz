class AnkiConnectClient
  include HTTParty
  base_uri 'http://localhost:8765/'
  
  HEADERS = { 'Content-Type' => 'application/json' }

  class << self
    def create_card
      post('', body: body, headers: HEADERS)
    end
    
    private
    
    def body
      {
        "action": "addNote",
        "version": 6,
        "params": {
          "note": {
            "deckName": "German",
            "modelName": "Basic",
            "fields": {
              "Front": "front content. Not a duplicate! #{Time.now}",
              "Back": "back content"
            },
            "options": {
              "allowDuplicate": false,
              "duplicateScope": "deck",
              "duplicateScopeOptions": {
                "deckName": "Default",
                "checkChildren": false,
                "checkAllModels": false
              }
            }
          }
        }
      }.to_json
    end
  end
end
