class PokemonsController < ApplicationController
  def index
    @pokemons = Poke.includes(:image).page(params[:page]).per(10)
  end

  def show_all
    # Define allowed sort columns
    allowed_sort_columns = %w[name first_type second_type]

    # Get sort column and direction from params with validation
    sort_column = params[:sort].in?(allowed_sort_columns) ? params[:sort] : 'name'
    sort_direction = %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    @pokemons = Poke.order("#{sort_column} #{sort_direction}")
  end

  def show
    @pokemon = Poke.find(params[:id])
  end
end
