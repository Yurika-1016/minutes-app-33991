class CreateToDoLists < ActiveRecord::Migration[6.0]
  def change
    create_table :to_do_lists do |t|
      t.text :list1, null:false
      t.text :list2
      t.text :list3
      t.text :list4
      t.text :list5
      t.text :list6
      t.text :list7
      t.text :list8
      t.text :list9
      t.text :list10
      t.boolean :checked_list1
      t.boolean :checked_list2
      t.boolean :checked_list3
      t.boolean :checked_list4
      t.boolean :checked_list5
      t.boolean :checked_list6
      t.boolean :checked_list7
      t.boolean :checked_list8
      t.boolean :checked_list9
      t.boolean :checked_list10
      t.references :user, null:false, foreign_keys: true
      t.references :minute, null:false, foreign_keys: true
      t.timestamps
    end
  end
end
