class AddPhotoToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :photo_file_name, :string # Original filename
    add_column :users, :photo_content_type, :string # Mime type
    add_column :users, :photo_file_size, :integer # File size in bytes
    add_column :users, :photo_updated_at, :datetime
  end

  def self.down
    remove_column :users, :photo_file_name
    remove_column :users, :photo_content_type
    remove_column :users, :photo_file_size
    remove_column :users, :photo_updated_at
  end
end
