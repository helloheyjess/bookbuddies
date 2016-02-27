class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :group_name
      t.string :book_name
      t.binary :cover_image
      t.string :author
      t.text :description
      t.string :location
      t.datetime :inceptDate

      t.timestamps null: false
    end
  end
end
