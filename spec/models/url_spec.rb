require 'rails_helper'

RSpec.describe Url, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  context "create Link" do
    it "create a Url with a short link" do
      url = Url.create({:original => 'http://www.elpais.es', :link =>  Link.new(identifier: "elpais", url: nil)})
      expect(url.original).to eq('http://www.elpais.es')
      expect(url.link.identifier).to eq('elpais')
    end
  end
end
