class CreateIntegrations < ActiveRecord::Migration
  def change
    create_table :integrations do |t|
      t.integer :entity_id
      t.string :status

      t.timestamps
    end
  end
end
