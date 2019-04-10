require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < Minitest::Test
  def setup
    @recipe = Recipe.new("lasagna")
    @recipe2 = Recipe.new("spaghetti")

    @salt = Ingredient.new("salt", "mg", 10)
    @cheese = Ingredient.new("cheese", "g", 50)
    @sauce = Ingredient.new("sauce", "cup(s)", 80)

    @recipe.add_ingredient(@salt, 20)
    @recipe.add_ingredient(@cheese, 10)
    @recipe.add_ingredient(@sauce, 3)

  end

  def test_recipe_class_exists
    assert_instance_of Recipe, @recipe
  end

  def test_attributes_exists
    assert_equal "lasagna", @recipe.name
  end

  def test_ingredients_hash_initializes_empty
    expected = {}
    assert_equal expected, @recipe2.ingredients
  end

  def test_add_ingredient_adds_ingredients_to_recipe_ingredients_hash
    expected = { "salt" => "20 mg",
                  "cheese" => "10 g",
                  "sauce" => "3 cup(s)"
                }
    assert_equal expected, @recipe.ingredients
  end

  def test_calories_adds_up_all_ingredient_calories_in_recipe
    assert_equal 140, @recipe.calories
  end

  def test_quantity_needed_for_ingredient_returns_quantity_of_ingredient_in_recipe
    assert_equal "10 g", @recipe.quantity_needed_for_ingredient(@cheese)
  end

end
