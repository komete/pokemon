require "test_helper"

class PokemonsControllerTest < ActionController::TestCase
  def setup
    @pokemon1 = pokemons(:one)
    @pokemon2 = pokemons(:two)
  end
  def teardown
    @pokemon1 = nil
    @pokemon2 = nil
  end

  test "index" do
    get :index
    assert_response :success
  end

  test "show" do
    get :show, params: {id: @pokemon1.id}
    assert_response :success

    assert_raises(ActiveRecord::RecordNotFound) do
      get :show, params: {id: "3"}
    end
  end

  test "create" do
    assert_difference('Pokemon.count') do
      post :create, params: {name: "Draco", type1: "Dragon", type2: "fire", total: 3000, hp: 1200, attack: 2000, defense: 6000, sp_atk: 1000, sp_def: 700, speed: 5000,generation: 10, legendary: true}
    end

    assert_no_difference('Pokemon.count') do
      post :create, params: {power: 200}
    end
  end

  test "update" do
      put :update, params: {id: @pokemon2.id, pokemon: {name: "Godlike"}}
      assert_response :success

      assert_raises(ActiveRecord::RecordNotFound) do
        put :update, params: {id: "3", pokemon: {name: "Godlike"}}
      end
  end

  test "destroy" do
    assert_difference('Pokemon.count', -1) do
      delete :destroy, params: {id: @pokemon1.id}
    end

    assert_raises(ActiveRecord::RecordNotFound, "We can't delete twice the same pokemon") do
      delete :destroy, params: {id: @pokemon1.id}
    end

    assert_raises(ActiveRecord::RecordNotFound) do
      delete :destroy, params: {id: "3"}
    end
  end

end
