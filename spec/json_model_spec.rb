require "spec_helper"

describe JsonModel do

  it "should save json version" do
    json = JobListingJsonModels::Base.from_json("{}")

    json = json.to_json_version(1)
    json = ActiveSupport::JSON.decode(json)

    json.should == {"__version"=>1, "requirements"=>{"drivers_license"=>{"types"=>0}}, "worktime"=>{"types"=>0}, "seasons"=>0, "num_positions"=>1, "locations"=>[], "categories"=>[], "contacts"=>[], "union_contacts"=>[], "duration"=>{"starts_on"=>nil}}
  end

  it "should load json to current version" do
    attrs = ActiveSupport::JSON.decode("{}")

    JobListingJsonModels::Migrator.should_receive(:migrate).with(attrs, JobListingJsonModels::MIN_VERSION, 1).and_return({})

    json = JobListingJsonModels::Base.from_json_to_current_version("{}")
    json.should be_an_instance_of(JobListingJsonModels::Base)
    json.__version.should == 1
  end
end
