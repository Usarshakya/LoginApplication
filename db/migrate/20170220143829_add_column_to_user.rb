class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :sring
    add_column :users, :image, :string
  end
end
