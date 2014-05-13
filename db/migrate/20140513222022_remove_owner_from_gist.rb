class RemoveOwnerFromGist < ActiveRecord::Migration
  def change
    remove_column :gists, :owner, :string
  end
end
