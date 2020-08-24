class CreateProtests < ActiveRecord::Migration[6.0]
  def change
    create_table :protests do |t|
      t.boolean :experienced
      t.date :date
      t.time :time
      t.text :description
      t.references :station, null: false, foreign_key: true

      t.timestamps
    end
  end
end
