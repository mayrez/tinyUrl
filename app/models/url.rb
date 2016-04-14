class Url < ActiveRecord::Base
  has_one :link
  attr_reader :custom
  def self.create_link( original, custom = nil )
    url = Url.create( original: original )

    identifier = custom.blank? || !Link.where(identifier: custom).empty? ?
      url.id.to_s(36) : custom

    if Link.where(identifier: identifier).empty?
      Link.create( identifier: identifier, url: url)
    else
      url.destroy
      create_link( original )
    end
  end
  # POST /urls
  def create
    @url = Url.create_link(url_params[:original], url_params[:custom]).url
    redirect_to @url, notice: 'Url was successfully created.'
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def url_params
    params.require(:url).permit(:original, :custom)
  end
end
