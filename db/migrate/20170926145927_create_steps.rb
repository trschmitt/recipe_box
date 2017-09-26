class CreateSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :steps do |t|
      t.references :recipe
      t.text :description

      t.timestamps
    end

    add_foreign_key :steps, :recipes, on_delete: :cascade
  end
end
