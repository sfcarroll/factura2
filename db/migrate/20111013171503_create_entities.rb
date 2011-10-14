class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :name
      t.string :abn
      t.string :address
      t.string :phone
      t.string :status
      t.string :system

      t.timestamps
    end
  end
end
