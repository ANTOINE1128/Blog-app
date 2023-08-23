class RemoveColumnsFromMultipleTables < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :createdAt , :datetime
    remove_column :likes, :updatedAt , :datetime
    remove_column :posts, :createdAt , :datetime
    remove_column :posts, :updatedAt , :datetime
    remove_column :users, :createdAt , :datetime
    remove_column :users, :updatedAt , :datetime
  end
end
