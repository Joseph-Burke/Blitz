require 'yaml'

class Card
  class Template
    TEMPLATE_FILE = "app/models/card/data/card_templates.yml"

    attr_accessor :id

    def initialize(id)
      @id = id
      templates = YAML.load_file(TEMPLATE_FILE)['templates']
      @data = templates.find { |template| template["id"] == id }
    end

    def name
      "German — #{@data["name"]}"
    end
    
    def fields
      @data["fields"]
    end

    def image_generation_field
      case @id
      when 'grammar' then 'Example'
      when 'vocab_noun' then 'Noun'
      when 'vocab_verb' then 'Verb'
      else nil
    end
    end
  end
end
