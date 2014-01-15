class AddNotificationToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :notification, :boolean, :default => true
  end
end
