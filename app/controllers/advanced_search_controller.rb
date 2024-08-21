class AdvancedSearchController < ApplicationController
  def index
    # Fetch search parameters from the request
    @selected_first_type = params[:first_type]
    @selected_second_type = params[:second_type]

    # Define the possible types for dropdown options
    @first_types = ['Bug', 'Dark', 'Dragon', 'Electric', 'Fairy', 'Fighting', 'Fire', 'Flying', 'Ghost', 'Grass', 'Ground', 'Ice', 'Normal', 'Poison', 'Psychic', 'Rock', 'Steel', 'Water']
    @second_types = @first_types + ['None']

    # Filter Pokemons based on search parameters
    @pokemons = Poke.all

    @pokemons = @pokemons.where(first_type: @selected_first_type) if @selected_first_type.present?
    @pokemons = @pokemons.where(second_type: @selected_second_type) if @selected_second_type.present? && @selected_second_type != 'None'
  end
end
