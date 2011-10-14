class Integration < ActiveRecord::Base
  belongs_to :entity
  has_many :integration_details, :dependent => :destroy
  
  accepts_nested_attributes_for :integration_details, :allow_destroy => true
  
  STATUS_ACTIVE = 'active'
  STATUS_INACTIVE = 'inactive'
  
   validates :status, :inclusion => { :in => [STATUS_ACTIVE, STATUS_INACTIVE], :message => "Please assign a status."}
   
   class << self
     def status_collection
       {
           "Active" => STATUS_ACTIVE,
           "Inactive" => STATUS_INACTIVE
       }
     end
  end
  
  def status_tag
     case self.status
       when STATUS_INACTIVE then :warning
       when STATUS_ACTIVE then :ok
     end
  end
   
end
