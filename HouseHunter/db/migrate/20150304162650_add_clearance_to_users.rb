class AddClearanceToUsers < ActiveRecord::Migration

=begin
this class is the database migration for clearance for users, this class provides users with tokens used to define whether
a user is online and encrypt their password in the database.
=end

  # this method creates fields in the database which allow for new fields.
  def self.up
    change_table :users  do |t|
      t.string :email
      t.string :encrypted_password, limit: 128
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128
    end
    
    add_index :users, :remember_token

    users = select_all("SELECT id FROM users WHERE remember_token IS NULL")

    users.each do |user|
      update <<-SQL
        UPDATE users
        SET remember_token = '#{Clearance::Token.new}'
        WHERE id = '#{user['id']}'
      SQL
    end
  end

  # this method edits the users table in the database by encrypting their password and adding a confirmation token.
  def self.down
    change_table :users do |t|
      t.remove :encrypted_password,:confirmation_token,:remember_token
    end
  end
end
