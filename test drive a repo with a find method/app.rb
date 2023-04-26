require_relative 'lib/database_connection'
require_relative 'lib/recipes_repository'
DatabaseConnection.connect('recipes_directory')

# Perform a SQL query on the database and get the result set.

recipe = RecipeRepository.new
recipe.all.each do |dish|
  p dish.name
end
