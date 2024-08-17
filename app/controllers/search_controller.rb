class SearchController < ApplicationController
  def index
    @query = Poke.ransack(params[:q])
    @pokes = @query.result(distinct: true)
  end
end
