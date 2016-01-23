class AddDataToRepos < ActiveRecord::Migration
  def change
    add_column :repositories, :owner, :string
    add_column :repositories, :language, :string
    add_column :repositories, :watchers_count, :integer
    add_column :repositories, :subscribers_count, :integer
    add_column :repositories, :forks, :integer
    add_column :repositories, :open_issues_count, :integer
    add_column :repositories, :network_count, :integer
    add_column :repositories, :size, :integer
    add_timestamps :repositories
  end
end
