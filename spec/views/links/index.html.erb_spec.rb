require 'rails_helper'

RSpec.describe "links/index", type: :view do
  before(:each) do
    assign(:links, [
      Link.create!(
        :identifier => "Identifier"
      ),
      Link.create!(
        :identifier => "Identifier"
      )
    ])
  end

  it "renders a list of links" do
    render
    assert_select "tr>td", :text => "Identifier".to_s, :count => 2
  end
end
