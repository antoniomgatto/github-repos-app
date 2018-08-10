class CreateRepositories < ActiveRecord::Migration[5.1]
  def change
    create_table :repositories do |t|
      t.string :node_id
      t.string :name
      t.string :full_name
      t.boolean :private_repo
      t.string :html_url
      t.string :description
      t.boolean :fork
      t.string :url
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :pushed_at
      t.string :homepage
      t.integer :size
      t.integer :stargazers_count
      t.integer :watchers_count
      t.string :language
      t.integer :forks_count
      t.integer :open_issues_count
      t.string :master_branch
      t.string :default_branch
      t.decimal :score

      t.timestamps
    end
  end
end
