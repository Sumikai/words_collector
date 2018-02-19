class RemoveTitleFromWords < ActiveRecord::Migration[5.1]
  def change
    remove_column :words, :title, :string
  end
end
