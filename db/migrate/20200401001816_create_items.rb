class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.references :category, foreign_key: {to_tabel: :categories}
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
