class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :provider, :string, index: true
    add_column :users, :uid, :string, index: true
  end
end
