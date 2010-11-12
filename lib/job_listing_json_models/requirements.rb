module JobListingJsonModels
  
  class Requirements
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend  ActiveModel::Naming
    include JsonModel
    include JsonModel::ValidationHelper
  
    attribute :drivers_license, DriversLicense
    attribute :education,       Education
    attribute :experience,      Experience
  
    attribute :own_car, Boolean # Specifies if the applicants needs to be able utilize a self-owned car.
    attribute :misc,    String  # A description of the required work experience.
  
    validates :drivers_license, :presence => true
  end

end
