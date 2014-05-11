class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.string :date
      t.string :owner
      t.string :description

      t.timestamps
    end
  end
end
