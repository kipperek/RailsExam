class CreateGists < ActiveRecord::Migration
  def change
    create_table :gists do |t|
      t.text :snippet
      t.string :lang
      t.string :description
      t.string :owner

      t.timestamps
    end
  end
end
