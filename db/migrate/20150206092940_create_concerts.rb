class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.column  :band,          :string, null: false
      t.column  :description,   :string, null: false
      t.column  :venue,         :string, null: false
      t.column  :city,          :string, null: false, default: "Barcelona"
      t.column  :date,          :date, null: false
      t.column  :price,         :decimal, precision: 4, scale: 2, null: false

      t.timestamps null: false
    end
  end
end
