class CreateLenses < ActiveRecord::Migration
  def change
    create_table :lenses do |t|
      t.string :name, :limit => 50, :null =>false
      t.string :url_name, :limit => 50, :null => false
      t.references :brand, :null => false
      t.integer :minimum_focal_range, :null => false
      t.integer :maximum_focal_range, :null => false

      t.timestamps
    end
  end
end
