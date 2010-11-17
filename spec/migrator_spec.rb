require "spec_helper"

describe JobListingJsonModels::Migrator do
  it "should load all files from migrations directory" do
    JobListingJsonModels::Migrator.migrate({}, 1)
  end
end
