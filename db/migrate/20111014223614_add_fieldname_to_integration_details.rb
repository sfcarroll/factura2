class AddFieldnameToIntegrationDetails < ActiveRecord::Migration
  def change
    add_column :integration_details, :fieldname, :string
  end
end
