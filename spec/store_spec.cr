require "./spec_helper"

describe Kiwi::Store do
  it "has a name" do
    store = Kiwi::Store.new("flavors")
    store.name.should eq("flavors")
  end

  it "returns an ID when pushing an entry" do
    store = Kiwi::Store.new("airlines")
    id = store.push("PanAm")
    id.should_not be_nil
  end

  it "return the entry's value, given its ID" do
    store = Kiwi::Store.new("currencies")
    id = store.push("DKK")
    store.get(id).should eq("DKK")
  end
end
