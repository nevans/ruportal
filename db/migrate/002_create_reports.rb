class CreateReports < Sequel::Migration
  def up
    create_table :reports do
      primary_key :id
      String :name
      Text :sql_code
      Text :ruby_code
    end
  end

  def down
    drop_table :reports
  end
end
