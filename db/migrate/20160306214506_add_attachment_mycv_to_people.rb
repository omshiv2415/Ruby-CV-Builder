class AddAttachmentMycvToPeople < ActiveRecord::Migration
  def self.up
    change_table :people do |t|
      t.attachment :mycv
    end
  end

  def self.down
    remove_attachment :people, :mycv
  end
end
