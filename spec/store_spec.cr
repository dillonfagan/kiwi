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

  it "returns nil if the ID does not exist" do
    store = Kiwi::Store.new("empty")

    store.get(Kiwi::ID.new).should be_nil
  end

  it "returns the entry's value with #get" do
    store = Kiwi::Store.new("currencies")
    id = store.push("DKK")

    store.get(id).should eq("DKK")
  end

  it "raises an IDException with #patch if the ID does not exist" do
    store = Kiwi::Store.new("anything")

    expect_raises(Kiwi::StoreException, "Invalid ID") do
      store.patch(Kiwi::ID.new, "value")
    end
  end

  it "updates an entry's value with #patch" do
    store = Kiwi::Store.new("colors")
    id = store.push("orange")
    store.patch(id, "black")

    store.get(id).should eq("black")
  end

  it "deletes an entry with #delete" do
    store = Kiwi::Store.new("countries")
    id = store.push("Estonia")
    store.delete(id)

    store.get(id).should be_nil
  end
end
