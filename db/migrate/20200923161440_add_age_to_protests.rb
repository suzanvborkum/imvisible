class AddAgeToProtests < ActiveRecord::Migration[6.0]
  def change
    add_column :protests, :age, :integer
  end
end
