class AddSequenceToIntegrationDetails < ActiveRecord::Migration
  def change
    add_column :integration_details, :sequence, :integer
  end
end
