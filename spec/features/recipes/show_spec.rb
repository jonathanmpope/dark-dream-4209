require 'rails_helper'

RSpec.describe Recipe, type: :feature do 
    describe 'show page' do 
        it 'has a show page with ingredient names' do 
            recipe1 = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
            noodles = recipe1.ingredients.create!(name: "noodles", cost:3)
            red_sauce = recipe1.ingredients.create!(name: "red sauce", cost:2)
            mushrooms = recipe1.ingredients.create!(name: "mushrooms", cost:1)

            visit "/recipes/#{recipe1.id}"

            expect(page).to have_content(recipe1.name)
            expect(page).to have_content(noodles.name)
            expect(page).to have_content(red_sauce.name)
            expect(page).to have_content(mushrooms.name)
        end 

        it 'has a show page with the total cost of all ingredients' do 
            recipe1 = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
            noodles = recipe1.ingredients.create!(name: "noodles", cost:3)
            red_sauce = recipe1.ingredients.create!(name: "red sauce", cost:2)
            mushrooms = recipe1.ingredients.create!(name: "mushrooms", cost:1)

            visit "/recipes/#{recipe1.id}"

            expect(page).to have_content(recipe1.name)
            expect(page).to have_content("Total cost: 6")
        end 
    end 
end 