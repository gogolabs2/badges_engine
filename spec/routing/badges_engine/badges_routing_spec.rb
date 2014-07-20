require "spec_helper"

describe BadgesEngine::BadgesController, :type => :routing do
  describe "routing" do

    before do
      BadgesEngine::Engine.load_engine_routes('badges')
    end

    it "routes to #index" do
      expect(get("/badges/badges")).to route_to("badges_engine/badges#index")
    end

    it "routes to #new" do
      expect(get("/badges/badges/new")).to route_to("badges_engine/badges#new")
    end

    it "routes to #show" do
      expect(get("/badges/badges/1")).to route_to("badges_engine/badges#show", :id => "1")
    end

    it "routes to #edit" do
      expect(get("/badges/badges/1/edit")).to route_to("badges_engine/badges#edit", :id => "1")
    end

    it "routes to #create" do
      expect(post("/badges/badges")).to route_to("badges_engine/badges#create")
    end

    it "routes to #update" do
      expect(put("/badges/badges/1")).to route_to("badges_engine/badges#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(delete("/badges/badges/1")).to route_to("badges_engine/badges#destroy", :id => "1")
    end

  end
end
