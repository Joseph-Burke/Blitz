require 'yaml'

class Card
  class Template
    TEMPLATE_FILE = "app/models/card/data/card_templates.yml"

    attr_accessor :fields, :name

    def initialize(name)
      @name = name
      @fields = YAML.load_file(TEMPLATE_FILE)[@name]
    end
  end
end
