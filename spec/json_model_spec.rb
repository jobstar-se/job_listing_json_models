require "spec_helper"

describe JsonModel do

  it "should save json version" do
    json = JobListingJsonModels::Base.from_json("{}")

    json = json.to_json_version(1)
    json.should == ""
  end
end
