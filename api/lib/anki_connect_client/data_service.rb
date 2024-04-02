class AnkiConnectClient
  class DataService
    # This class is responsible for converting a Card into the data required by the AnkiConnect API.

    def initialize(card)
      @card = card
    end

    def convert_to_anki_data
      # Convert the card into the format required by the AnkiConnect API
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
      @card.fields.to_hash
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
        "url": @card.image_url,
        "filename": "#{Time.now.to_i}.jpg",
        "skipHash": "8d6e4646dfae812bf39651b59d7429ce",
        "fields": [
          "Image"
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
          "Audio"
        ]
      }]
    end
  end
end