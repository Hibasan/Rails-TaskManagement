class AddIndexsToTasks < ActiveRecord::Migration[5.2]
  def change
    add_index  :tasks, :title
    add_index  :tasks, :status
    add_index  :tasks, :priority
    add_index  :tasks, :limit
  end
end
