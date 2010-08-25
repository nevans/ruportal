class CreateReports < Sequel::Migration
  def up
    create_table :reports do
      primary_key :id
      String :name, :null => false
      Text :code, :null => false
      String :code_type, :default => :sql, :null => false
    end
  end

  def down
    drop_table :reports
  end
end
