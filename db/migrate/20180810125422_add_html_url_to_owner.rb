class AddHtmlUrlToOwner < ActiveRecord::Migration[5.1]
  def change
    add_column :owners, :html_url, :string
  end
end
