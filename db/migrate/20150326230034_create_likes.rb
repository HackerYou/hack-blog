class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string :name
      t.references :post, index: true

      t.timestamps null: false
    end
    add_foreign_key :likes, :posts
  end
end
