class Card
  include ActiveModel::Model

  attr_accessor *%i(card_type fields model_name)

  def initialize *args
    @deck_name |= 'German'
  end

  def options
    {
      "allowDuplicate": false,
      "duplicateScope": "deck",
      "duplicateScopeOptions":
        {
          "deckName": "Default",
          "checkChildren": false,
          "checkAllModels": false,
        },
    }
  end

  def card_template
    {
      'pronunciation' => 'Pronunciation',
      'grammar' => 'Grammar',
      'noun' => 'Vocabulary — Noun',
      'verb' => 'Vocabulary — Verb'
    }[@card_type]
  end

  def deck_name
    'German'
  end
end
