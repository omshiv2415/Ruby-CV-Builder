class AddColumnToSkill < ActiveRecord::Migration
  def change
     add_column :skills, :skillType,  :string
  end
end
