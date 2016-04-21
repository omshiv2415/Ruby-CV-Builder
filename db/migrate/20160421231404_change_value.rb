class ChangeValue < ActiveRecord::Migration
  def change
    change_column :people, :gecseEnglishGrade, :string, :limit => 4
    change_column :people, :gcseMathsGrade, :string, :limit => 4
  end
end
