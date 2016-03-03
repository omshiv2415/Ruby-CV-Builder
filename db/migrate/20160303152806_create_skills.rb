class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.integer :idSkills
      t.integer :Person_idUser, limit: 10
      t.string :skillName, limit: 100
      t.string :skillLevel
      t.integer :verified, limit: 1
      t.string :howVerified, limit: 45
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
