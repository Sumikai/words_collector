class CreateWords < ActiveRecord::Migration[5.1]
  def change
    create_table :words do |t|
      t.text :content
      t.integer :user_id
      t.string :name

      t.timestamps
    end
  end
end
