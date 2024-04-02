class Card
  include ActiveModel::Model

  attr_accessor :template, :fields, :image_url
  delegate :fields, to: :template, prefix: true

  def initialize(template:, parameters:)
    @template = Template.new(template)
    @fields = Fields.new(template: @template, parameters: parameters)
    @image_url = OpenAiClient.new.get_image_url(@fields.image_generation_text)
  end

  def deck_name
    'German'
  end
end
