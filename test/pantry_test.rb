require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'

class PantryTest < Minitest::Test
  def setup
    @pantry = Pantry.new

    @cheese = Ingredient.new("Cheese", "C", 50)
    @mac = Ingredient.new("Macaroni", "oz", 200)
    @mac_and_cheese = Recipe.new("Mac and Cheese")

    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
  end

  def test_pantry_class_exists
    assert_instance_of Pantry, @pantry
  end

  def test_pantry_stock_initializes_as_empty_hash
    expected = {}
    assert_equal expected, @pantry.stock
  end

  def test_stock_check_returns_items_in_pantry_stock
    assert_equal 0, @pantry.stock_check(@cheese)
  end

  def test_restock_adds_ingredients_to_pantry_stock
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)

    assert_equal 15, @pantry.stock_check(@cheese)
  end

  def test_enough_ingredients_for_returns_true_if_there_are_one_of_each_ingredient
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)

    refute @pantry.enough_ingredients_for?(@mac_and_cheese)

    @pantry.restock(@mac, 10)

    assert @pantry.enough_ingredients_for?(@mac_and_cheese)
  end
end
