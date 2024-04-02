class Card
  class Fields
    attr_reader :template, :parameters

    def initialize(template:, parameters:)
      @template = template
      @parameters = parameters
    end

    def image_generation_text
      to_hash[@template.image_generation_field]
    end

    def unfilled_fields
      @template.fields - @parameters.keys
    end

    def permitted_fields
      @template.fields
    end

    # Returns the fields that are both valid (present in the template) and filled
    def valid_fields
      @template.fields.select { |field| @parameters[field.downcase] }
    end

    # Returns a hash with the valid fields and their values in @parameters
    def to_hash
      valid_fields.each_with_object({}) do |field, hash|
        hash[field] = @parameters[field.downcase]
      end
    end
  end
end