class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :full_name
      t.string :description
      t.boolean :fork
      t.string :html_url
      t.string :api_url
      t.string :organization
    end
  end
end
