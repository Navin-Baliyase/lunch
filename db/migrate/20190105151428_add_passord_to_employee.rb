class AddPassordToEmployee < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :password_hash, :string
    add_column :employees, :password_salt, :string
  end
end
