class Ingredient
  attr_reader :name,
              :measure_unit,
              :calories
def initialize(name, measure_unit, calories)
  @name = name
  @measure_unit = measure_unit
  @calories = calories
end

end
