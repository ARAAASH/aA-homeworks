class AddColumnToGoals < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :completed?, :string, null: false, default: 'no'
  end
end
