class AddColumnOauthToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :oauth_token, :integer
  end
end
