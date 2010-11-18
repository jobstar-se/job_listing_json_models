class ChangeFirstDay < JobListingJsonModels::Version
  def self.migrate(json_hash)
    HashConverter.convert!(json_hash) do
      map "first_day", "duration.starts_on"
    end
  end
end
