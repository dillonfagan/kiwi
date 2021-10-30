require "./spec_helper"

describe Kiwi::Store do
  describe "#new" do
    it "sets the name" do
      store = Kiwi::Store.new("flavors")

      store.name.should eq("flavors")
    end
  end

  describe "#push" do
    it "returns an ID" do
      store = Kiwi::Store.new("airlines")
      id = store.push("PanAm")

      id.should_not be_nil
    end
  end

  describe "#get" do
    it "raises StoreException, given invalid ID" do
      store = Kiwi::Store.new("empty")

      expect_raises(Kiwi::StoreException, "Invalid ID") do
        store.get(Kiwi::ID.new)
      end
    end

    it "returns an entry's value" do
      store = Kiwi::Store.new("currencies")
      id = store.push("DKK")

      store.get(id).should eq("DKK")
    end
  end

  describe "#patch" do
    it "raises StoreException, given invalid ID" do
      store = Kiwi::Store.new("anything")

      expect_raises(Kiwi::StoreException, "Invalid ID") do
        store.patch(Kiwi::ID.new, "value")
      end
    end

    it "updates an entry's value" do
      store = Kiwi::Store.new("colors")
      id = store.push("orange")
      store.patch(id, "black")

      store.get(id).should eq("black")
    end
  end

  describe "#delete" do
    it "raises StoreException, given invalid ID" do
      store = Kiwi::Store.new("anything")

      expect_raises(Kiwi::StoreException, "Invalid ID") do
        store.delete(Kiwi::ID.new)
      end
    end

    it "deletes an entry" do
      store = Kiwi::Store.new("countries")
      id = store.push("Estonia")
      store.delete(id)

      expect_raises(Kiwi::StoreException, "Invalid ID") do
        store.get(id)
      end
    end
  end
end
