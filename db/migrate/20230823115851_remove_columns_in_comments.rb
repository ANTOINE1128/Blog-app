class RemoveColumnsInComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :createdAt , :datetime
    remove_column :comments, :updatedAt , :datetime
  end
end
