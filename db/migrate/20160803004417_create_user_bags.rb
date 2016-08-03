class CreateUserBags < ActiveRecord::Migration
  def change
    create_table :user_bags do |t|
      t.references :user, index: true, foreign_key: true
      t.references :agent, index: true 
      t.references :bag, index: true, foreign_key: true
      t.references :delivery, index: true, foreign_key: true
      t.float :kg

      t.timestamps null: false
    end
  end
end
