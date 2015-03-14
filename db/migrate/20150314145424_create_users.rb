class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.date :date_of_birth

      t.timestamps null: false
    end
  end
end
