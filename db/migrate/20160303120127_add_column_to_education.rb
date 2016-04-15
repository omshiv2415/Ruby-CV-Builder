class AddColumnToEducation < ActiveRecord::Migration
  def change
    add_column :educatioal_qualifications, :user_id, :integer
  end
end
