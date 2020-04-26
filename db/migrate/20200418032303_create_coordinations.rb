class CreateCoordinations < ActiveRecord::Migration[5.2]
  def change
    create_table :coordinations do |t|
      t.string :name
      t.string :image
      t.string :brand
      t.integer :spring_id
      t.integer :summer_id
      t.integer :autumn_id
      t.integer :winter_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
