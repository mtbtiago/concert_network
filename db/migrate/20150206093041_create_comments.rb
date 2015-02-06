class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.column  :concert_id,    :integer, null: false
      t.column  :author,        :string, null: false
      t.column  :when,          :datetime, null: false
      t.column  :comment,       :text, null: false

      t.timestamps null: false
    end
  end
end
