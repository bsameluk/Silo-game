class CreatePlayerAttributes < ActiveRecord::Migration[7.1]
  def change

    execute <<-SQL
      CREATE TYPE player_attributes_type AS ENUM (
        'bio_info', 'health_status', 'hobbies', 'character', 'additional_info', 'knowledge', 'inventory'
      );
    SQL

    create_table :player_attributes do |t|
      t.column :attr_type, :player_attributes_type, null: false
      t.text :content
      t.timestamps
    end
  end
end
