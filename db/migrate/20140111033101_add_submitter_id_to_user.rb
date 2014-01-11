class AddSubmitterIdToUser < ActiveRecord::Migration
  def change
    add_column :posts, :submitter_id, :integer
  end
end
