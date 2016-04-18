require 'json'
require 'faraday'

class Admin::CategoriesController < Admin::BaseController
  def new
    @category = Category.new
  end
  def create
    @category ||= Category.create(category_params)
    @gif = @category.gifs.create(image_path: get_gif(@category.title))
    redirect_to root_path
  end

  def get_gif(category)
  gif = Faraday.get("http://api.giphy.com/v1/gifs/search?q='#{formatted_category(category)}'&api_key=dc6zaTOxFJmzC")
  JSON.parse(gif.body)["data"].sample["images"]["fixed_height"]["url"]
  end

  def formatted_category(category)
    category.split(" ").join("+")
  end

private

  def category_params
    params.require(:category).permit(:title)
  end

end
