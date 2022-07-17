require 'rails_helper'

RSpec.describe Ingredient, type: :feature do 
    describe 'index page' do 
        it 'has an index page with ingredient names and the number o recipes each ingredient has' do 
            recipe1 = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
            noodles = recipe1.ingredients.create!(name: "noodles", cost:3)
            red_sauce = recipe1.ingredients.create!(name: "red sauce", cost:2)
            mushrooms = recipe1.ingredients.create!(name: "mushrooms", cost:1)

            recipe2 = Recipe.create!(name: "Tacos", complexity: 1, genre: "Mexican")
            tortilla = recipe2.ingredients.create!(name: "tortilla", cost:1)
            beef = recipe2.ingredients.create!(name: "beef", cost:3)
            salsa = recipe2.ingredients.create!(name: "salsa", cost:1)
            RecipeIngredient.create!(recipe_id: recipe2.id , ingredient_id: mushrooms.id)

            recipe3 = Recipe.create!(name: "Cheeseburger", complexity: 2, genre: "American")
            bun = recipe3.ingredients.create!(name: "bun", cost:1)
            RecipeIngredient.create!(recipe_id: recipe3.id , ingredient_id: beef.id)
            RecipeIngredient.create!(recipe_id: recipe3.id , ingredient_id: salsa.id)
            cheese = recipe3.ingredients.create!(name: "cheese", cost:1)

            visit '/ingredients'
            save_and_open_page

            expect(page).to have_content("#{noodles.name}: 1")
            expect(page).to have_content("#{mushrooms.name}: 2")
            expect(page).to have_content("#{salsa.name}: 2")
        end 
    end 
end 