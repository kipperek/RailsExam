class RemoveOwnerFromPost < ActiveRecord::Migration
  def change
    remove_column :posts, :owner, :string
  end
end
