class ChangeAtt < ActiveRecord::Migration
  def change
    change_column :referees, :permissionToContact, :string, :limit => 14
  end
end
