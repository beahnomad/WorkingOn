class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :user_name
      t.string :user_id
      t.text :text

      t.timestamps null: false
    end
    add_index :works, :user_id
  end
end
