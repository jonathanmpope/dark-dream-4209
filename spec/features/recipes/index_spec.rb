require 'rails_helper'

RSpec.describe Recipe, type: :feature do 
    describe 'index page' do 
        it 'has an index page with a list of recipes with recipe names' do 
            recipe1 = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
            recipe2 = Recipe.create!(name: "Tacos", complexity: 1, genre: "Mexican")
            recipe3 = Recipe.create!(name: "Cheeseburger", complexity: 3, genre: "American")

            visit '/recipes'

            expect(page).to have_content(recipe1.name)
            expect(page).to have_content(recipe2.name)
            expect(page).to have_content(recipe3.name)
        end
        
        it 'has an index page with a list of recipes with recipe complexity' do 
            recipe1 = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
            recipe2 = Recipe.create!(name: "Tacos", complexity: 1, genre: "Mexican")
            recipe3 = Recipe.create!(name: "Cheeseburger", complexity: 3, genre: "American")

            visit '/recipes'

            expect(page).to have_content(recipe1.complexity)
            expect(page).to have_content(recipe2.complexity)
            expect(page).to have_content(recipe3.complexity)
        end

        it 'has an index page with a list of recipes with recipe names' do 
            recipe1 = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
            recipe2 = Recipe.create!(name: "Tacos", complexity: 1, genre: "Mexican")
            recipe3 = Recipe.create!(name: "Cheeseburger", complexity: 3, genre: "American")

            visit '/recipes'

            expect(page).to have_content(recipe1.genre)
            expect(page).to have_content(recipe2.genre)
            expect(page).to have_content(recipe3.genre)
        end

        it 'recipes show up in alphabetical order' do 
            recipe1 = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
            recipe2 = Recipe.create!(name: "Tacos", complexity: 1, genre: "Mexican")
            recipe3 = Recipe.create!(name: "Cheeseburger", complexity: 3, genre: "American")

            visit '/recipes'

            within ("#recipes") do 
                expect(page.all('.recipe')[0]).to have_content(recipe3.name)
                expect(page.all('.recipe')[1]).to have_content(recipe1.name)
                expect(page.all('.recipe')[2]).to have_content(recipe2.name)
            end 
        end
    end 
end 