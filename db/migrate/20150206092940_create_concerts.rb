class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.column  :band,          :string, null: false
      t.column  :description,   :string, null: false
      t.column  :venue,         :string, null: false
      t.column  :city,          :string, null: false #, default: "Barcelona"
      t.column  :date,          :date, null: false
      t.column  :price,         :decimal, precision: 6, scale: 2, null: false

      # decimal precision is TOTAL number of digits. 6 -> 9(4)v(2)
      # decimal scale are decimals
      # defaul value for strings don't work. It puts "barcelona 'varchar string"
      # string -> varchar()
      # text -> CLOB

      t.timestamps null: false
    end
  end
end
