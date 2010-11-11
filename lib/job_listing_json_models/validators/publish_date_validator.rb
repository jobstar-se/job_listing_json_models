class PublishDateValidator < ActiveModel::EachValidator
  DATE_FORMAT = /^\d{4}-\d{2}-\d{2}$/
  
  def validate_each(object, attribute, value)
    publish_date = Time.at(value)
    min_date     = DateTime.parse(PublishDateValidator.min_date)
    
    if publish_date < min_date
      object.errors[attribute] << (options[:message] || "Date should be future") 
    end
  end
  
  def self.min_date
    Time.now.strftime("%Y-%m-%d")
  end
end