ActiveAdmin.register Entity do
  
  # TODO: some ruby 1.9 syntax to try out at a later date once the code is all working
  # I personally love the new hash syntax: {:a => 1} becomes {a:1}
  
  scope :all, :default => true
  
  scope :active do |entities|
    entities.where(:status => Entity::STATUS_ACTIVE)
  end
  scope :inactive do |entities|
    entities.where(:status => Entity::STATUS_INACTIVE)
  end
 
  
  index do
    column :status do |entity|
      status_tag entity.status, entity.status_tag
    end
    column :name do |entity|    
      link_to "#{entity.name}", admin_entity_path(entity)
    end
    column :abn
    column do |entity|
      link_to("Details", admin_entity_path(entity)) + " | " + \
      link_to("Edit", edit_admin_entity_path(entity)) + " | " + \
      link_to("Delete", admin_entity_path(entity), :method => :delete, :confirm => "Are you sure?")
    end
  end
    
    
  show :title => :name do
    panel "Business Entity Details" do
      attributes_table_for entity do
        row("Name") {entity.name}
        row("Status") {status_tag entity.status, entity.status_tag}
        row("ABN"){entity.abn}
        row("System") {entity.system}
      end
    end
    
    panel "Contact Details" do
      attributes_table_for entity do
        row("Address"){entity.address}
        row("Phone"){entity.phone}  
      end
    end
  end  
    
  form do |f|
    f.inputs "Business Entity Details" do
      f.input :name, :input_html => {:style => "width: 200px"},  :as => :string
      f.input :abn, :input_html => {:style => "width: 80px"}, :hint => "Only applicable for Australian companies", :as => :string
      f.input :status, :collection => Entity.status_collection, :as => :radio
      f.input :system, :collection => Entity.system_collection, :as => :radio
    end    
      
    f.inputs "Contact Details" do
      f.input :address
      f.input :phone
    end
      
    f.buttons
  end
end    

