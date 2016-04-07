class AddForeignKeyToSkills < ActiveRecord::Migration
  def change
    add_reference :experiences, :person, index: true, foreign_key: true
    add_reference :jobpreferences, :person, index: true, foreign_key: true
  end
end