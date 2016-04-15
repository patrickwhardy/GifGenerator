class GifsController < ApplicationController
  def index
    @gifs = Gif.all
  end

  def show
    @gif = Gif.find(params[:id])
    @category = Category.find(@gif.category_id)
  end
end
