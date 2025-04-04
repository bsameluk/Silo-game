# == Schema Information
#
# Table name: player_attributes
#
#  id         :bigint           not null, primary key
#  attr_type  :enum             not null
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PlayerAttribute < ApplicationRecord

  # enums
  enum attr_type: AttributeTypes::DICT, _prefix: :attr_type

  # modules
  include AttributeTypes

  # validations
  validates :attr_type, presence: true, inclusion: { in: AttributeTypes::ALL }


end
