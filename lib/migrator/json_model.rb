module JsonModel
  def to_json_version(version)
    json_hash = JobListingJsonModels::Migrator.migrate(self.as_json, self.__version, version)
    json_hash["__version"] = version
    ActiveSupport::JSON.encode(json_hash)
  end

  module ClassMethods
    def versioned
      self.attribute(:__version, Integer, :default => 0)
    end

    def from_json_to_current_version(json)
      attrs = ActiveSupport::JSON.decode(json)

      to_version   = JobListingJsonModels::Migrator.latest_version
      from_version = attrs["__version"] || JobListingJsonModels::MIN_VERSION

      json_hash    = JobListingJsonModels::Migrator.migrate(attrs, from_version.to_i, to_version)
      json_hash["__version"] = to_version

      new(json_hash)
    end
  end
end
