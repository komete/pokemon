class PokemonsController < ActionController::API
  def index
    @pokemons = Pokemon.all
    paginate json: @pokemons, per_page: 50
  end

  def show
    @pokemon = Pokemon.find(params[:id])

    if stale?(last_modified: @pokemon.updated_at)
      render json: @pokemon
    else
      render json: {status: "error", code: 500, message: "item not found"}
    end
  end

  def create
    @pokemon = Pokemon.new(pokemons_params)

    if @pokemon.save
      render json: @pokemon
    else
      render json: {status: "error", code: 500, message: "Error occured when creating the item"}
    end
  end

  def update
    @pokemon = Pokemon.find(params[:id])

    if @pokemon.update(pokemons_params)
      render json: @pokemon
    else
      render json: {status: "error", code: 500, message: "Error occured when updating the item"}
    end
  end

  def destroy
    @pokemon = Pokemon.find(params[:id])
    @pokemon.destroy
  end

  private
    def pokemons_params
      params.permit(:name, :type1, :type2, :total, :hp, :attack, :defense, :sp_atk, :sp_def, :speed, :generation, :legendary)
    end
end
