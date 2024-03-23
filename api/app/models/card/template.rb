require 'yaml'

class Card::Template
  TEMPLATE_FILE = "data/templates.yml"
  attr_accessor :fields

  class Card::Template
    def initialize(template_name)
      templates = YAML.load_file(TEMPLATE_FILE)
      @fields = templates[template_name]
    end
  end
end
