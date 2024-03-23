class Card
  include ActiveModel::Model

  attr_accessor *%i(
    type
    template
    fields
  )

  def initialize card_params
    @type = card_params[:cardType].downcase
    @fields = card_params.except :cardType
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

  def template
    card_template_name = {
      'pronunciation' => 'Pronunciation (Phoneme)',
      'grammar' => 'Grammar',
      'noun' => 'Vocabulary — Noun',
      'verb' => 'Vocabulary — Verb'
    }[@type]

    "German — #{card_template_name}"
  end

  def deck_name
    'German'
  end
end
