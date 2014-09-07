class AddNdbNoToListItem < ActiveRecord::Migration
  def change
    add_column :list_items, :ndb_no, :string
    add_index :list_items, :ndb_no
  end
end
