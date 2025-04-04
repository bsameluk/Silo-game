class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.string :name

      t.string :bio_info
      t.boolean :is_show_bio_info
      t.string :health_status
      t.boolean :is_show_health_status
      t.string :hobbies
      t.boolean :is_show_hobbies
      t.string :character
      t.boolean :is_show_character
      t.string :additional_info
      t.boolean :is_show_additional_info
      t.string :knowledge
      t.boolean :is_show_knowledge
      t.string :inventory
      t.boolean :is_show_inventory

      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
