require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'

class IngredientTest < Minitest::Test
  def setup
    @ingredient = Ingredient.new("salt", "mg", 10)
  end

  def test_ingredient_class_exists
    assert_instance_of Ingredient, @ingredient
  end

  def test_attributes_exists
    assert_equal "salt", @ingredient.name
    assert_equal "mg", @ingredient.measure_unit
    assert_equal 10, @ingredient.calories
  end

end
