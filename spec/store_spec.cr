require "./spec_helper"

describe Kiwi::Store do
  describe "#new" do
    it "sets the name" do
      store = Kiwi::Store.new("flavors")

      store.name.should eq("flavors")
    end
  end

  describe "#put" do
    it "returns a summary with the value" do
      store = Kiwi::Store.new("airlines")
      summary = store.put("PanAm")

      summary.body.should eq("PanAm")
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
      summary = store.put("DKK")

      store.get(summary.id).body.should eq("DKK")
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
      summary = store.put("orange")
      store.patch(summary.id, "black")

      store.get(summary.id).body.should eq("black")
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
      summary = store.put("Estonia")
      store.delete(summary.id)

      expect_raises(Kiwi::StoreException, "Invalid ID") do
        store.get(summary.id)
      end
    end
  end
end
