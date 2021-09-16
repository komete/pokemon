require "test_helper"

class PokemonTest < ActiveSupport::TestCase
  test "should not save a pokemon without at least a name" do
    pokemon = Pokemon.new
    assert_not pokemon.save

    pokemon = Pokemon.new(name: "ok")
    assert pokemon.save
  end
end
