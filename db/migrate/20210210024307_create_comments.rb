class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :title, null:false
      t.references :user, null: false, foreign_keys: true
      t.references :minute, null: false, foreign_keys: true
      t.timestamps
    end
  end
end
