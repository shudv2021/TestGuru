class Admin::GistsControlle < Admin::BaseController
  before_action :authenticate_user!

  def index
    @gists = Gist.all
  end

  def show
    @gist = Gist.find(params[:id])
  end

end
