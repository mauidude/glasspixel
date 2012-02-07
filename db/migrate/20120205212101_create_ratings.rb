class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :photo_metadata, :null => false
      t.integer :value, :null => false
      t.datetime :created_at
    end

    change_table :photo_metadata do |t|
      t.integer :ratings_sum, :default => 0, :null => false
      t.integer :ratings_count, :default => 0, :null => false

    end
  end
end
