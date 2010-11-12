module JobListingJsonModels

  class Employer
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend  ActiveModel::Naming
    include JsonModel
    include JsonModel::ValidationHelper
  
    attribute :name,          String
    attribute :national_id,   String
    attribute :country,       String
    attribute :email,         String
    attribute :phone,         String
    attribute :website,       String
    attribute :mail_address,  String
    attribute :visit_address, String
    attribute :anonymous,     Boolean 
  
    #validates :name,         :presence => true EITHER NAME OR ANONYMOUS SHOULD BE FALSE
  end

end
