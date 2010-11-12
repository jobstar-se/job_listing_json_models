module JobListingJsonModels
  
  class Location
    include JsonModel
    
    COUNTRY   = 1
    REGION    = 2
    CITY      = 3
    CITY_AREA = 4
    
    attribute :level,   String # The level of specificity of the location
    attribute :id,      String # The JobStar.se code of the location
    attribute :address, String # The visit address of the work location
    attribute :city,    String # Temporary hack until we have location mapping for all sources
    attribute :region,  String 
    attribute :country, String
  end

end
