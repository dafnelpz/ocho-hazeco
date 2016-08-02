class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.boolean :user
      t.boolean :agent
      t.boolean :admin

      t.timestamps null: false
    end
  end
end
