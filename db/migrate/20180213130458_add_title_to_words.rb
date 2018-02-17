class AddTitleToWords < ActiveRecord::Migration[5.1]
  def change
    add_column :words, :title, :string
  end
end
