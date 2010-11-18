module JsonModel
  def to_json_version(version)
    json_hash = JobListingJsonModels::Migrator.migrate(self.as_json, version)
    ActiveSupport::JSON.encode(json_hash)
  end
end
