class CreateSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :steps do |t|
      t.text :descritpion
      t.integer :recipe_id

      t.timestamps
    end
  end
end
