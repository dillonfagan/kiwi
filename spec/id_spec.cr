require "./spec_helper"

describe Kiwi::ID do
    it "has a non-nil string value when initialized" do
        Kiwi::ID.new.to_s.should_not be_nil
    end

    it "retains the value passed into #initialize" do
        id = Kiwi::ID.new("my value")
        id.to_s.should eq("my value")
    end
end