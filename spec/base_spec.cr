require "./spec_helper"

describe Kiwi::Base do
    describe "#new" do
        it "is empty when new" do
            base = Kiwi::Base.new

            base.stores.empty?.should be_true
        end
    end

    describe "#create" do
        it "is not empty after creating a store" do
            base = Kiwi::Base.new
            base.create("cities")

            base.stores.empty?.should be_false
        end
    end

    describe "#store" do
        it "raises BaseException, given invalid store name" do
            base = Kiwi::Base.new

            expect_raises(Kiwi::BaseException, "Invalid store name") do
                base.store("nothing")
            end
        end

        it "retrieves an existing store" do
            base = Kiwi::Base.new
            base.create("houses")

            base.store("houses").should_not be_nil
        end
    end
end