class PokemonsController < ApplicationController
  def index
    @pokemons = Poke.includes(:image).page(params[:page]).per(10)
  end
end
