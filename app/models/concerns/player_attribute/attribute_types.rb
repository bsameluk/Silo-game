module PlayerAttribute::AttributeTypes
  extend ActiveSupport::Concern

  BIO_INFO          = 'bio_info'.freeze
  HEALTH_STATUS     = 'health_status'.freeze
  HOBBIES           = 'hobbies'.freeze
  CHARACTER         = 'character'.freeze
  ADDITIONAL_INFO   = 'additional_info'.freeze
  KNOWLEDGE         = 'knowledge'.freeze
  INVENTORY         = 'inventory'.freeze

  DICT = {
    bio_info:       BIO_INFO,
    health_status: HEALTH_STATUS,
    hobbies: HOBBIES,
    character: CHARACTER,
    additional_info: ADDITIONAL_INFO,
    knowledge: KNOWLEDGE,
    inventory: INVENTORY,
  }.freeze
  ALL = [BIO_INFO, HEALTH_STATUS, HOBBIES, CHARACTER, ADDITIONAL_INFO, KNOWLEDGE, INVENTORY].freeze

  def attr_type
    self.class.attr_types[super]
  end

  def attr_type_was
    self.class.attr_types[super]
  end
end
