class AddPassordDigestToEmployee < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :password_digest, :string
  end
end
