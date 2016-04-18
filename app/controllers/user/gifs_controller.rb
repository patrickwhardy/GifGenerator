class User::GifsController < Admin::BaseController
  def create
    byebug
    @gif = Gif.create
  end
end
