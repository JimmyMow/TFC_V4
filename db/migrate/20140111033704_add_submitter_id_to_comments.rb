class AddSubmitterIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :submitter_id, :integer
  end
end
