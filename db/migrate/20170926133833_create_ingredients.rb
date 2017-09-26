class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.references :recipe
      t.integer :count
      t.string :name
      t.integer :recipe_id

      t.timestamps
    end

    add_foreign_key :ingredients, :recipes, :on_delete: :cascade
  end
end
