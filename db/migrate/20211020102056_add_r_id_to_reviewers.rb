class AddRIdToReviewers < ActiveRecord::Migration[6.1]
  def change
    add_column :reviewers, :child_id, :integer
    add_column :reviewers, :admin_id, :integer
    add_column :reviewers, :post_id, :integer
    rename_column :reviewers, :post_id, :task_id
  end
end
