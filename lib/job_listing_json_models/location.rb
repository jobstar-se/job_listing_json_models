module JobListingJsonModels
  
  class Location
    include ActiveModel::Validations
    include JsonModel
    include JsonModel::ValidationHelper
    
    COUNTRY   = 1
    REGION    = 2
    CITY      = 3
    CITY_AREA = 4
    
    attribute :id,      Integer # The JobStar.se code of the location
    attribute :address, String # The visit address of the work location
    attribute :at_home, Boolean

    attribute :city,    String # Temporary hack until we have location mapping for all sources
    attribute :region,  String 
    attribute :country, String

    validates :id, :presence => true
  end

end
