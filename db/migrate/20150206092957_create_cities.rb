class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.column  :name,          :string, null: false

      t.timestamps null: false
    end
  end
end
