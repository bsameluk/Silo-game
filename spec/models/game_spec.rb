# == Schema Information
#
# Table name: games
#
#  id          :bigint           not null, primary key
#  description :string
#  max_players :integer
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Game, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
