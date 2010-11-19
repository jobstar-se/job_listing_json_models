require "spec_helper"

describe JobListingJsonModels::Migrator do
  it "should load all files from migrations directory" do
    JobListingJsonModels::Migrator.migrate({}, 0, 1)
    Class.const_defined?(:ChangeFirstDay).should be_true
  end

  it "should call the migrate method of each migration" do
    ChangeFirstDay.should_receive(:migrate).with({})
    JobListingJsonModels::Migrator.migrate({}, 0, 1)
  end

  it "should migrate json up to the given version number" do
    hash = JobListingJsonModels::Migrator.migrate({}, 0, 1)
    hash.should == {:duration => {:starts_on => nil}}
  end

  it "should return the latest migration number" do
    number = JobListingJsonModels::Migrator.latest_version
    number.should == 1
  end
end
