module JobListingJsonModel

  class Education
    include JsonModel
    include ActiveModel::Conversion  
    extend  ActiveModel::Naming
    
    HIGH_SCHOOL      = 1
    BACHELORS_DEGREE = 2
    MASTERS_DEGREE   = 3
    PHD              = 4
    
    attribute :type, Integer # A value specifying with level of education should be held by applicants.
    attribute :text, String  # An additional description of the required education.
  end

end
