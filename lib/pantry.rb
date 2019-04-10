class Pantry
  attr_reader :stock
  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, quantity)
    @stock[ingredient] += quantity
  end

  def enough_ingredients_for?(recipe)
    enough_ingredients = []
    recipe.ingredients.flat_map do |recipe_ingredient|
      @stock.keys.each do |stock_ingredient|
        if recipe_ingredient[0] == stock_ingredient.name && @stock.values[0] >= recipe_ingredient[1].scan(/\d/).flatten[0].to_i
          enough_ingredients << true
        else
          enough_ingredients << false
        end
      end
    end
    require "pry"; binding.pry
    enough_ingredients
    enough_ingredients.all? do |tf|
      tf == true
    end
  end
end
