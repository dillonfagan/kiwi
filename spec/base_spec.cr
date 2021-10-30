require "./spec_helper"

describe Kiwi::Base do
    it "is empty when initialized" do
        base = Kiwi::Base.new
        base.stores.empty?.should be_true
    end

    it "is not empty after creating a store" do
        base = Kiwi::Base.new
        base.create("cities")
        base.stores.empty?.should be_false
    end

    it "retrieves an existing store" do
        base = Kiwi::Base.new
        base.create("houses")
        base.store("houses").should_not be_nil
    end
end