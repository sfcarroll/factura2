ActiveAdmin.register Integration do
  scope :all, :default => true
  
  index do
    column :status do |integration|
      status_tag integration.status, integration.status_tag
    end
    column :entity
    
    column do |integration|
      link_to("Details", admin_integration_path(integration)) + " | " + \
      link_to("Edit", edit_admin_integration_path(integration)) + " | " + \
      link_to("Delete", admin_integration_path(integration), :method => :delete, :confirm => "Are you sure?")
    end
  end
  
  show :title => :entity_id do
    panel "Integration" do
      attributes_table_for integration do
        row("Entity") {integration.entity_id} 
        row("Status") {status_tag integration.status, integration.status_tag}
      end
    end
    
    panel "Integration Details" do
      table_for integration.integration_details do |t|   
        t.column("Sequence"){|integration_detail| integration_detail.sequence}
         t.column("Field"){|integration_detail| integration_detail.fieldname}
         t.column("Technical Name"){|integration_detail| integration_detail.techname}
         t.column("Required"){|integration_detail| integration_detail.required}
       end
    end
  end  
  
  form do |f|
    f.inputs "Entity" do
      f.input :entity_id
    end
    
    f.inputs "Integration Details" do
      f.has_many :integration_details do |i|
        i.input :_destroy, :as => :boolean, :label => "Delete this item" unless i.object.id.nil?
        i.input :sequence
        i.input :fieldname
        i.input :techname
        i.input :required
      end
    end
    f.buttons
  end        
end
