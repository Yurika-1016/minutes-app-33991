class CreatePins < ActiveRecord::Migration[6.0]
  def change
    create_table :pins do |t|
      t.references :user, null: false, foreign_keys: true
      t.references :minute, null: false, foreign_keys: true
      t.timestamps
    end
  end
end
