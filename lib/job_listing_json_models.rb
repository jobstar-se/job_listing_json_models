require 'job_listing_json_models/drivers_license'
require 'job_listing_json_models/experience'
require 'job_listing_json_models/education'

Dir[File.join(File.dirname(__FILE__), 'job_listing_json_models', '*.rb')].each do |model|
  require model
end

autoload :PublishDateValidator, "job_listing_json_models/validators/publish_date_validator"

module JobListingJsonModels

  class Base
    include ActiveModel::Validations
    include ActiveModel::Conversion  
    extend  ActiveModel::Naming
    include JsonModel
    include JsonModel::ValidationHelper
    
    # Location types
    LOCATION_SPECIFIED   = 1
    LOCATION_HOME        = 2
    LOCATION_UNSPECIFIED = 3
    
    # Seasons
    SUMMER = 1
    AUTUMN = 2
    WINTER = 4
    SPRING = 8
    
    attribute :id,         String     # The unique identifier of the job listing. This value is assigned by JobStar.se. It is null if not yet assigned.
    attribute :posted_at,  TimeStamp  # Time at which the job listing was posted on the source.
    attribute :updated_at, TimeStamp  # Time at which the job listing was updated at the source.
    attribute :deleted_at, TimeStamp  # Time at which the job listing was deleted from the source.
    
    attribute :publish_on, TimeStamp
    
    attribute :source,              String     # The domain name of the source from which the job listing was fetched.
    attribute :source_listing_id,   String     # The id by which the job listing is referenced at the source.
    attribute :source_url,          String     # The url of the job listing at the source.
    
    attribute :title,      String     # The title of the job listing.
    attribute :body,       String     # The main text which may include job description, company description, and requirement description.
    
    attribute :employer,     Employer
    attribute :requirements, Requirements
    attribute :worktime,     Worktime
    attribute :duration,     Duration
    attribute :salary,       Salary
    attribute :application,  Application
    
    attribute :location_type, Integer  # A value that represents the type of work location.
    attribute :seasons,       Bitfield # A bitmap representing which seasons a seasonal position is needed.
    attribute :num_positions, Integer  # The number of positions that need to be filled.
    
    attribute :first_day, TimeStamp    # The date of the first day of the job.
    attribute :keywords,  Array        # An array of keywords that represent the position.
    
    attribute :co_founder, Boolean     # Is the listed position for a co-founder of a business.
    attribute :contractor, Boolean     # False if the position offers employment. True if the position is for a contractor.
    
    attribute :admin_email,    String
    attribute :admin_password, String
    
    has_many :locations                          # An array with work place locations.
    has_many :categories                         # An array with work categories that match the listed position.
    has_many :contacts                           # An array with contact information.
    has_many :union_contacts, :class => Contact  # An array with contact information to union representatives.
    
    # validations
    validates :posted_at, :presence => true
    validates :updated_at, :presence => true
    validates :source, :presence => true
    validates :source_listing_id, :presence => true
    validates :title, :presence => true
    validates :body, :presence => true
    validates :num_positions, :numericality => { :greater_than => 0 }
    
    validates :publish_on, :publish_date => {
      :if      => Proc.new { |job| job.step == 2 },
      :message => "Date should be future"
    }
    
    validates :admin_email, :confirmation => {
      :if => Proc.new { |job| job.step == 2 },
      :message => "Admin email not valid"
    }
    
    attr_writer :step
    
    def has_season?(season)
      seasons & season == season
    end
    
    def humanize_dates
      self.first_day  = self.first_day  == 0 || self.first_day.nil?  ? "" : Time.at(self.first_day).strftime("%Y-%m-%d")
      self.publish_on = self.publish_on == 0 || self.publish_on.nil? ? "" : Time.at(self.publish_on).strftime("%Y-%m-%d")
      
      deadline = self.application.deadline
      deadline = deadline == 0 || deadline.nil? ? "" : Time.at(deadline).strftime("%Y-%m-%d")
      self.application.deadline = deadline
    end
    
    def step
      @step || 1
    end
  end
end
