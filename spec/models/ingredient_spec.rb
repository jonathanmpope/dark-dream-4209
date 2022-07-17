require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :cost}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:recipes).through(:recipe_ingredients)}
  end

  describe 'class methods' do
    describe '#self.cost' do 
      it 'counts the total cost of all recipes' do 
        recipe1 = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
        noodles = recipe1.ingredients.create!(name: "noodles", cost:3)
        red_sauce = recipe1.ingredients.create!(name: "red sauce", cost:2)
        mushrooms = recipe1.ingredients.create!(name: "mushrooms", cost:1)

        expect(recipe1.ingredients.cost).to eq(6)
      end 
    end 
  end
end
