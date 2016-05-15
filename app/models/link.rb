class Link < ActiveRecord::Base
  belongs_to :url
  # POST /urls
  def create
    @link = Link.create_link(url_params[:identifier], url_params[:url]).url
    redirect_to @link, notice: 'Link was successfully created.'
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def url_params
    params.require(:link).permit(:identifier, :url)
  end
end

