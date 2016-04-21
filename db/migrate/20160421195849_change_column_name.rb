class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :skills, :skillName, :skill_name
    rename_column :educatioal_qualifications, :qualificationType, :qualification_type
    rename_column :experiences, :otherJobTitle, :other_jobtitle
  end
end
