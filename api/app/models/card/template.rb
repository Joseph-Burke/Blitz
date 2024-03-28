require 'yaml'

class Card
  class Template
    TEMPLATE_FILE = "app/models/card/data/card_templates.yml"

    def initialize(id)
      templates = YAML.load_file(TEMPLATE_FILE)['templates']
      @data = templates.find { |template| template["id"] == id }
    end

    def name
      "German — #{@data["name"]}"
    end
    
    def fields
      @data["fields"]
    end
  end
end
