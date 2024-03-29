class Card
  class Fields
    attr_reader :template, :parameters

    def initialize(template:, parameters:)
      @template = template
      @parameters = parameters
    end

    def unfilled_fields
      @template.fields - @parameters.keys
    end

    def to_hash
      template.fields.each_with_object({}) do |field, hash|
        hash[field] = parameters[field.downcase] unless parameters[field.downcase].nil?
      end
    end
  end
end