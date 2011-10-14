class Entity < ActiveRecord::Base
  has_many :integrations, :dependent => :destroy
  
  
  
  STATUS_ACTIVE = 'active'
  STATUS_INACTIVE = 'inactive'
  
  SYSTEM_ORACLE  = 'oracle'
  SYSTEM_MYOB = 'myob'
  SYSTEM_PEOPLESOFT = 'peoplesoft'
  SYSTEM_SAP = 'sap'
  SYSTEM_OTHER = 'other'
  
  validates :name, :address, :phone, :presence => true
  validates :status, :inclusion => { :in => [STATUS_ACTIVE, STATUS_INACTIVE], :message => "Please assign a status."}
  validates :system, :inclusion => { :in => [SYSTEM_ORACLE, SYSTEM_MYOB, SYSTEM_PEOPLESOFT, SYSTEM_SAP, SYSTEM_OTHER], :message => "Please choose a system."}
  
  class << self
    def status_collection
      {
          "Active" => STATUS_ACTIVE,
          "Inactive" => STATUS_INACTIVE
      }
    end
    
    def system_collection
      {
        "Oracle eBusiness" => SYSTEM_ORACLE,
        "MYOB" => SYSTEM_MYOB,
        "PeopleSoft" => SYSTEM_PEOPLESOFT,
        "SAP" => SYSTEM_SAP,
        "Other" => SYSTEM_OTHER
      }
    end  
  end  
  
  def status_tag
     case self.status
       when STATUS_INACTIVE then :warning
       when STATUS_ACTIVE then :ok
     end
  end
  
  def system_tag
    case self.system
      when SYSTEM_ORACLE then :ok 
      when SYSTEM_MYOB then :ok
      when SYSTEM_PEOPLESOFT then :ok
      when SYSTEM_SAP then :ok
      when SYSTEM_OTHER then :ok
    end
  end
end
