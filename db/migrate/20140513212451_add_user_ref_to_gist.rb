class AddUserRefToGist < ActiveRecord::Migration
  def change
    add_reference :gists, :user, index: true
  end
end
