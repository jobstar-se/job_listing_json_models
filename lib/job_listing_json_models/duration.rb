module JobListingJsonModels

  class Duration
    include JsonModel
    include ActiveModel::Validations
    include ActiveModel::Conversion  
    extend  ActiveModel::Naming
    
    LESS_THAN_TWO_WEEKS        = 1
    TWO_WEEKS_TO_THREE_MONTHS  = 2
    THREE_MONTHS_TO_SIX_MONTHS = 3
    MORE_THAN_SIX_MONTHS       = 4
    UNLIMITED_DURATION         = 5
    
    attribute :type, Integer # A value that specifies the type of duration.
    attribute :text, String  # An additional description of the duration.
    
    validates :type, :presence => true
  end

end
