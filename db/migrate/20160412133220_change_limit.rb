class ChangeLimit < ActiveRecord::Migration
  def change
    change_column :people, :authorityToWorkStatement, :string, :limit => nil
  end
end
