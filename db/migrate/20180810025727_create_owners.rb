class CreateOwners < ActiveRecord::Migration[5.1]
  def change
    create_table :owners do |t|
      t.string :login
      t.string :node_id
      t.string :avatar_url
      t.string :gravatar_id
      t.string :url
    end
  end
end
