module AnkiConnectClient
  class DataService
    # This class is responsible for converting a Card into the data required by the AnkiConnect API.

    def initialize(card)
      @card = card
    end

    def convert_to_anki_data
      # Convert the card into the data required by the AnkiConnect API
      {
        deck_name: deck_name,
        model_name: model_name,
        fields: fields,
        options: options,
        picture: picture,
        audio: audio
      }
    end

    private

    def deck_name
      # Retrieve the model name for the card
      @card.deck_name
    end

    def model_name
      # Retrieve the model name for the card
      @card.template.name
    end

    def fields
      # Retrieve the fields for the card
      raise ArgumentError, "fields must be a Card::Fields" unless fields.is_a?(Card::Fields)

      {
        "Front": "front content. Not a duplicate! #{Time.now}",
        "Back": "back content"
      }
    end

    def options
      # Retrieve the options for the card
      {
        "allowDuplicate": false,
        "duplicateScope": "deck",
        "duplicateScopeOptions": {
          "deckName": "German",
          "checkChildren": false,
          "checkAllModels": false
        }
      }
    end

    def picture
      # Retrieve the picture for the card
      [{
        "url": "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/A_black_cat_named_Tilly.jpg/220px-A_black_cat_named_Tilly.jpg",
        "filename": "black_cat.jpg",
        "skipHash": "8d6e4646dfae812bf39651b59d7429ce",
        "fields": [
          "Back"
        ]
      }]
    end

    def audio
      # Retrieve the audio for the card
      [{
        "url": "https://assets.languagepod101.com/dictionary/japanese/audiomp3.php?kanji=猫&kana=ねこ",
        "filename": "yomichan_ねこ_猫.mp3",
        "skipHash": "7e2c2f954ef6051373ba916f000168dc",
        "fields": [
          "Front"
        ]
      }]
    end
  end
end