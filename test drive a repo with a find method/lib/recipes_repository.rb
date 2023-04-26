require_relative './recipes'
class RecipeRepository
  def all
    sql = 'SELECT * FROM recipes;'
    result_set = DatabaseConnection.exec_params(sql,[])

    recipes = []


    result_set.each do |recipe|
      dish = Recipe.new
      dish.id =recipe['id']
      dish.name =recipe['name']
      dish.cooking_time = recipe['cooking_time']
      dish.rating = recipe['rating']

      recipes << dish
    end

    return recipes
  end

  def find_by_id(num)  
    sql ="SELECT * FROM recipes WHERE id = $1;"
    params = [num]
    result_set = DatabaseConnection.exec_params(sql, params)
    item = result_set.first
    dish = Recipe.new
    dish.id =item['id']
    dish.name =item['name']
    dish.cooking_time = item['cooking_time']
    dish.rating = item['rating']
    return dish
    
  end
end