class AddForeignKey < ActiveRecord::Migration
  def change
     add_reference :skills, :person, index: true, foreign_key: true
  end
end
