class RemoveFieldFromIntegrationDetail < ActiveRecord::Migration
  def up
    remove_column :integration_details, :field
  end

  def down
    add_column :integration_details, :field, :string
  end
end
