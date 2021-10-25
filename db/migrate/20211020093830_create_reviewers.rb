class CreateReviewers < ActiveRecord::Migration[6.1]
  def change
    create_table :reviewers do |t|
      t.references :task, null: false, foreign_key: true
      t.timestamps
    end
  end
end
