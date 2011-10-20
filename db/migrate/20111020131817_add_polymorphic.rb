class AddPolymorphic < ActiveRecord::Migration
  def change
    add_column :users, :logable_type, :string
    add_column :users, :logable_id, :integer
  end
end
