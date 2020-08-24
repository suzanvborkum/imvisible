class CreateAssaultCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :assault_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
