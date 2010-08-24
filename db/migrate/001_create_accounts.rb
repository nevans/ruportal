class CreateAccounts < Sequel::Migration
  def up
    create_table :accounts do
      primary_key :id
      String :name
      String :surname
      String :email
      String :crypted_password
      String :salt
      String :role
    end
  end

  def down
    drop_table :accounts
  end
end
