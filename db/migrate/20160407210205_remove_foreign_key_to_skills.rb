class RemoveForeignKeyToSkills < ActiveRecord::Migration
  def change
    remove_reference :experiences, :person, index: true, foreign_key: true
    remove_reference :jobpreferences, :person, index: true, foreign_key: true
    remove_reference :skills, :person, index: true, foreign_key: true
    remove_reference :educatioal_qualifications, :person, index: true, foreign_key: true
  end
end

