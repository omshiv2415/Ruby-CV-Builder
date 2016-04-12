class AddForeignKeyToSkills < ActiveRecord::Migration
  def change

    add_reference :jobpreferences, :person, index: true, foreign_key: true
    add_reference :skills, :person, index: true, foreign_key: true
    add_reference :educatioal_qualifications, :person, index: true, foreign_key: true
  end
end
