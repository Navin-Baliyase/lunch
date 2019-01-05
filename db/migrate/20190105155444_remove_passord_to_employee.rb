class RemovePassordToEmployee < ActiveRecord::Migration[5.0]
  def change
    remove_column :employees, :password_hash, :string
    remove_column :employees, :password_salt, :string
  end
end
