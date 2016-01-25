class CreateGithubTokens < ActiveRecord::Migration
  def change
    create_table :github_tokens do |t|
      t.string  :username
      t.string  :token
      t.boolean :claimed, default: false
      t.timestamps
    end
  end
end
