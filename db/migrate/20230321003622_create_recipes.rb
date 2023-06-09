class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :content
      t.string :image_path
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :meal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
