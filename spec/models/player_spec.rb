# == Schema Information
#
# Table name: players
#
#  id                      :bigint           not null, primary key
#  additional_info         :string
#  bio_info                :string
#  character               :string
#  health_status           :string
#  hobbies                 :string
#  inventory               :string
#  is_show_additional_info :boolean
#  is_show_bio_info        :boolean
#  is_show_character       :boolean
#  is_show_health_status   :boolean
#  is_show_hobbies         :boolean
#  is_show_inventory       :boolean
#  is_show_knowledge       :boolean
#  knowledge               :string
#  name                    :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  game_id                 :bigint           not null
#
# Indexes
#
#  index_players_on_game_id  (game_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_id => games.id)
#
require 'rails_helper'

RSpec.describe Player, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
