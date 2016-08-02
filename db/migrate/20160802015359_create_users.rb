class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :address, null: false
      t.references :role, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
