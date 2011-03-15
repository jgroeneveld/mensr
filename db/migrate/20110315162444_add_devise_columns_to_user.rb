class AddDeviseColumnsToUser < ActiveRecord::Migration
  def self.up
  	rename_column :users, :password_hash, :encrypted_password
  	rename_column :users, :is_admin, :admin
  	add_column :users, :reset_password_token, :string
  	add_column :users, :remember_token, :string
  	add_column :users, :remember_created_at, :datetime
  	add_column :users, :sign_in_count, :integer, :default => 0
  	add_column :users, :current_sign_in_at, :datetime
  	add_column :users, :last_sign_in_at, :datetime
  	add_column :users, :current_sign_in_ip, :string
  	add_column :users, :last_sign_in_ip, :string
  	add_column :users, :failed_attempts, :integer, :default => 0
  	add_column :users, :unlock_token, :string
  	add_column :users, :locked_at, :datetime
  	add_column :users, :authentication_token, :string

    add_index :users, :email,                :unique => true
  end

  def self.down
  	rename_column :users, :encrypted_password, :password_hash
  	rename_column :users, :admin, :is_admin
  	remove_column :users, :reset_password_token
  	remove_column :users, :remember_token
  	remove_column :users, :remember_created_at
  	remove_column :users, :sign_in_count
  	remove_column :users, :current_sign_in_at
  	remove_column :users, :last_sign_in_at
  	remove_column :users, :current_sign_in_ip
  	remove_column :users, :last_sign_in_ip
  	remove_column :users, :failed_attempts
  	remove_column :users, :unlock_token
  	remove_column :users, :locked_at
  	remove_column :users, :authentication_token

    remove_index :users, :email
  end
end
