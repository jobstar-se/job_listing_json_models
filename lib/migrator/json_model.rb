module JsonModel
  def self.from_json_version
    obj = super
    latest_version = JobListingJsonModels::Migrator.latest_version

    obj
  end

  def to_json_version(version)
    json_hash = JobListingJsonModels::Migrator.migrate(self.as_json, version)
    ActiveSupport::JSON.encode(json_hash)
  end

  module ClassMethods
    def versioned
      self.attribute(:__version, Integer, :default => 0)
    end
  end
end
