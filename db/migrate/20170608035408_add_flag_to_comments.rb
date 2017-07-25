class AddFlagToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :is_flagged, :boolean
  end
end
