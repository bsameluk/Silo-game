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
require "test_helper"

class PlayerAttributeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
