class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.date :age
      t.string :breed
      t.integer :weight
      t.string :bio
      t.string :vetname
      t.string :vetaddress
      t.integer :vetnumber
      t.timestamps null: false
    end
  end
end
