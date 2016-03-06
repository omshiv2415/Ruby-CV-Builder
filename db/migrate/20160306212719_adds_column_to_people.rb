class AddsColumnToPeople < ActiveRecord::Migration
  def change
    add_column :people, :mycv, :string
  end
end
