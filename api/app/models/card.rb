class Card
  include ActiveModel::Model

  attr_accessor *%i(
    type
    template
    fields
  )

  def initialize params
    @type = params[:cardType].downcase
    @fields = params.except :cardType
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
    card_template_name =  case @type
                          when 'pronunciation' then 'Pronunciation (Phoneme)'
                          when 'grammar' then 'Grammar'
                          when 'vocab' then "Vocab (#{@fields[:type]})"
                          end

    "German — #{card_template_name}"
  end

  def deck_name
    'German'
  end
end
