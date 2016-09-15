class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.boolean :user, default: false
      t.boolean :agent, default: false
      t.boolean :admin, default: false

      t.timestamps null: false
    end
  end
end
