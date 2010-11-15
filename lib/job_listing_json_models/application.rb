module JobListingJsonModels

  class Application
    include JsonModel
    include ActiveModel::Conversion
    extend  ActiveModel::Naming
  
    attribute :email,     String    # The email address to which the application should be sent.
    attribute :mail,      String    # The mail address to which the application should be sent.
    attribute :phone,     String    # The phone number to call to apply for the job.
    attribute :url,       String    # The url of the web page with the application form.
    attribute :reference, String    # The reference number that should be specified on the application.
    attribute :deadline,  TimeStamp # The application deadline.
    attribute :text,      String    # An additional description of the application procedure.
  end

end
