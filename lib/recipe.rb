class Recipe
  attr_reader :name,
              :ingredients,
              :calories
  def initialize(name)
    @name = name
    @ingredients = {}
    @calories = 0
  end

  def add_ingredient(ingredient, quantity)
    @ingredients[ingredient.name] = "#{quantity} #{ingredient.measure_unit}"
    @calories += ingredient.calories
  end

  def quantity_needed_for_ingredient(ingredient)
    @ingredients[ingredient.name]
  end
end
