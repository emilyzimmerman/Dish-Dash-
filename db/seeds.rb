#Users
(0..10).each do 
    User.create(
        email: Faker::Internet.email, 
        first_name: Faker::TvShows::BigBangTheory.character, 
        last_name: Faker::Name.last_name, 
        phone: "1", 
        password: "password", 
        username: Faker::Fantasy::Tolkien.character)
end

#Meals
Meal.create(mealType: "Breakfast")
Meal.create(mealType: "Lunch")
Meal.create(mealType: "Dinner")
Meal.create(mealType: "Dessert")
Meal.create(mealType: "Snacks")

#Recipes
# - meal
# - user 
# - recipe content
(0..100).each do |recipe|
    faker_name = Faker::Food.dish 
    faker_content = Faker::Food.description

    recipe = Recipe.new(user_id: rand(0..9), name: faker_name, content: faker_content, 
        image_path: "https://cdn.vectorstock.com/i/preview-1x/65/30/default-image-icon-missing-picture-page-vector-40546530.jpg")
        recipe.meal = Meal.all.sample
        recipe.ingredients = Ingredient.all.sample(rand(0..100))

        recipe.save
end

#ingredients
(0..100).each do |ingredient|
    faker_ingredient = Faker::Food.ingredient 
    faker_quantity = Faker::Number.number(digits: 3)

    ingredient = Ingredient.new(user_id: rand(0..9), quantity: faker_quantity, name: faker_ingredient)
    ingredient.save
end