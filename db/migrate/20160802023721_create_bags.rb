class CreateBags < ActiveRecord::Migration
  def change
    create_table :bags do |t|
      t.string :color, null: false

      t.timestamps null: false
    end
  end
end
