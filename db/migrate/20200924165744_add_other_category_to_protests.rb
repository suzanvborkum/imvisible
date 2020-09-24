class AddOtherCategoryToProtests < ActiveRecord::Migration[6.0]
  def change
    add_column :protests, :other_category, :string
  end
end
