class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.text :description, null: false
      t.integer :user_id, null: false
      t.string :ttype, null: false, default: 'public'

      t.timestamps
    end
    add_index :goals, :user_id
  end
end
