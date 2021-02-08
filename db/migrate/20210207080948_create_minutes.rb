class CreateMinutes < ActiveRecord::Migration[6.0]
  def change
    create_table :minutes do |t|
      t.string :title, null: false
      t.string :project_name, null: false
      t.text :participate_member, null: false
      t.string :meeting_date, null: false
      t.string :all_complete_date, null: false
      t.text :content, null: false
      t.references :user, null: false, foreign_keys: true
      t.timestamps
    end
  end
end
