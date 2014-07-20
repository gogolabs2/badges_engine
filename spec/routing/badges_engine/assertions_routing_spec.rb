require "spec_helper"

describe BadgesEngine::AssertionsController, :type => :routing do
  describe "routing" do
    
    before do
      BadgesEngine::Engine.load_engine_routes('badges')
    end

    it "routes to #bake_callback" do
      expect(get("/badges/a/1/THISISAKEY.json")).to route_to("badges_engine/assertions#bake_callback", 
                                                          :id=>"1", :token=>'THISISAKEY', :format=>'json')
    end

    it "routes to #index" do
      expect(get("/badges/assertions")).to route_to("badges_engine/assertions#index")
    end

    it "routes to #new" do
      expect(get("/badges/assertions/new")).to route_to("badges_engine/assertions#new")
    end

    it "routes to #show" do
      expect(get("/badges/assertions/1")).to route_to("badges_engine/assertions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(get("/badges/assertions/1/edit")).to route_to("badges_engine/assertions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(post("/badges/assertions")).to route_to("badges_engine/assertions#create")
    end

    it "routes to #update" do
      expect(put("/badges/assertions/1")).to route_to("badges_engine/assertions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(delete("/badges/assertions/1")).to route_to("badges_engine/assertions#destroy", :id => "1")
    end

  end
end
