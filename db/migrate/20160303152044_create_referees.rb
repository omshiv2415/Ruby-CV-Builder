class CreateReferees < ActiveRecord::Migration
  def change
    create_table :referees do |t|
      t.integer :idReferees, limit: 10
      t.integer :Persons_idUser, limit: 10
      t.string :title, limit: 10
      t.string :forename, limit: 45
      t.string :surname, limit: 45
      t.string :email, limit: 50
      t.string :contactPhone, limit: 16
      t.string :relationship, limit: 50
      t.integer :permissionToContact, limit: 1
      t.integer :verified, limit: 1
      t.string :howVerified, limit: 45
      t.string :referenceDoc
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
