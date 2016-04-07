class CreateJobpreferences < ActiveRecord::Migration
  def change
    create_table :jobpreferences do |t|
      t.string :jobtitle
      t.string :job_title
      t.string :job_role
      t.string :role_type
      t.string :location
      t.string :happy_to_relocate
      t.string :user_id

      t.timestamps null: false
    end
  end
end
