class CreateIntegrationDetails < ActiveRecord::Migration
  def change
    create_table :integration_details do |t|
      t.string :field
      t.string :techname
      t.boolean :required
      t.string :actions
      t.integer :integration_id

      t.timestamps
    end
  end
end
