require 'spec_helper'

describe "badges_engine/badges/show.html.haml", :type => :view do
  before(:each) do
    @badge = assign(:badge, stub_model(BadgesEngine::Badge,
      :version => "Version",
      :name => "Name",
      :image => "Image",
      :description => "Description",
      :criteria => "Criteria"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/Image/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/Description/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/Criteria/)
  end
end
