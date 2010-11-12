module JobListingJsonModels
  
  class Salary
    include JsonModel
    include ActiveModel::Validations
    include ActiveModel::Conversion  
    extend  ActiveModel::Naming
    
    FIXED                   = 1
    FIXED_PERFORMANCE_BASED = 2
    PERFORMANCE_BASED       = 3
    NONE                    = 4
    
    attribute :type, Integer # A value specifying the type of salary
    attribute :text, String  # An additional description of the salary
    
    #validates :type, :presence => true
  end

end
