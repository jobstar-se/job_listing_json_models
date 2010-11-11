module JobListingJsonModule

  class Contact
    include JsonModel
    include ActiveModel::Conversion  
    extend  ActiveModel::Naming
    
    attribute :name,      String
    attribute :title,     String
    attribute :email,     String
    attribute :phone,     String
    attribute :other,     String
    attribute :formatted, String # The formatted field can be populated instead of
                                 # the specific fields if it is not possible to parse
                                 # the contact information of a fetched job listing into 
                                 # the structured format. 
  end

end
