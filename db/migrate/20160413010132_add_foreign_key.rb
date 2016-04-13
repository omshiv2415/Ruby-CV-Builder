class AddForeignKey < ActiveRecord::Migration
  def change
     add_reference :skills, :user, index: true, foreign_key: true
  end
end
