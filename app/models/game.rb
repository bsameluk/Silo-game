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
class Game < ApplicationRecord
  has_many :players

  validates :name, presence: true
  validates :max_players, presence: true, numericality: { greater_than: 0 }
end
