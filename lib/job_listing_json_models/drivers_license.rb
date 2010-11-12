module JobListingJsonModels

  class DriversLicense
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend  ActiveModel::Naming
    include JsonModel
    include JsonModel::ValidationHelper
  
    A1    = 1
    A     = 2 
    B     = 4
    BE    = 8
    C     = 16
    CE    = 32
    D     = 64
    DE    = 128
    TAXI  = 256

    attribute :types, Bitfield # A bitmap representing the drivers licenses that should be held by the applicants.
    attribute :text,  String   # An additional description of the required licenses.
  
    def has_type?(type)
      types & type == type
    end
  end

end
