require 'rails_helper'

RSpec.describe "Urls", type: :request do
  describe "GET /urls" do
    it "get the front page" do
      get urls_path
      expect(response).to have_http_status(200)
    end
  end
  describe "POST /urls/new" do
    it "create new Url" do
      visit new_url_path
	  fill_in "Original", :with => 'http://www.elpais.es'
	  fill_in "Custom Url", :with => 'elpais'
	  click_button 'Create Url'
      page.should have_content ('Url was successfully created.')
    end
  end
end
