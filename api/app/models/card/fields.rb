class Card
  class Fields
    def initialize(template:, parameters:)
      @template = template
      @parameters = parameters
    end

    def unfilled_fields
      @template.fields - @parameters.keys
    end
  end
end