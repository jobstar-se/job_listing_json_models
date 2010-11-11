module JobListingJsonModel

  # Specifies the work experience requirements that applicants should fulfil.
  class Experience
    include JsonModel
    include ActiveModel::Conversion
    extend  ActiveModel::Naming
  
    NONE                  = 1
    MORE_THAN_SIX_MONTHS  = 2
    MORE_THAN_THREE_YEARS = 3
    MORE_THAN_FIVE_YEARS  = 4
  
    #attribute :years_current_position, Integer # The number of years applicants should have held a position at the same level  as the listed position.
    #attribute :years_total, Integer            # The number of years of total work experience applicants should have.
    attribute :text,        String             # An additional description of the required work experience.
  
    attribute :type,  String
  end

end
