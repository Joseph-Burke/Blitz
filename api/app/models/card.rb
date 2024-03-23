class Card
  include ActiveModel::Model

  attr_accessor :template
  delegate :fields, to: :template, prefix: true

  def initialize(template:, parameters:)
    @template = Template.new(template)
    @fields = Fields.new(template: @template, parameters: parameters)

    # fill unfilled fields
    # @fields.unfilled_fields
  end

  def options
    {
      "allowDuplicate": false,
      "duplicateScope": "deck",
      "duplicateScopeOptions": {
        "deckName": "Default",
        "checkChildren": false,
        "checkAllModels": false
      }
    }
  end

  def deck_name
    'German'
  end

  def picture
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
