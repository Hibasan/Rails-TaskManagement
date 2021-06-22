class AddColumsToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :limit, :date , null:false ,default:"2100-01-01"
    add_column :tasks, :status, :string
    add_column :tasks, :priority, :string
  end
end
