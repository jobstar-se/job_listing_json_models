require "spec_helper"

describe JsonModel do

  it "should save json version" do
    json = JobListingJsonModels::Base.from_json("{}")

    json = json.to_json_version(1)
    json = ActiveSupport::JSON.decode(json)

    json.should == {"requirements"=>{"drivers_license"=>{"types"=>0}}, "worktime"=>{"types"=>0}, "seasons"=>0, "num_positions"=>1, "locations"=>[], "categories"=>[], "contacts"=>[], "union_contacts"=>[], "duration"=>{"starts_on"=>nil}}
  end
end
