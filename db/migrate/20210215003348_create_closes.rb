class CreateCloses < ActiveRecord::Migration[6.0]
  def change
    create_table :closes do |t|
      t.references :minute, null:false, foreign_keys: true
      t.timestamps
    end
  end
end
