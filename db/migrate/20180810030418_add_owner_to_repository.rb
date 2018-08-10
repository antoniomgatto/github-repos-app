class AddOwnerToRepository < ActiveRecord::Migration[5.1]
  def change
    add_reference :repositories, :owner, foreign_key: true
  end
end
