class Card
  include ActiveModel::Model

  attr_accessor *%i(
    card_type
    card_template
    fields
  )

  def initialize card_params
    @card_type = card_params[:card_type]
    @card_template = card_params[:card_template]
    @fields = card_params[:fields]
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
