class CreateProtestAssaults < ActiveRecord::Migration[6.0]
  def change
    create_table :protest_assaults do |t|
      t.references :protest, null: false, foreign_key: true
      t.references :assault_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
