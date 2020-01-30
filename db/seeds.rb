require 'faker'
# Restaurant.all.clear
# Dish.all.clear
# DishTag.all.clear
# Tag.all.clear

20.times do
    Restaurant.create(name: Faker::Restaurant.unique.name)
end

Restaurant.all.each do |i|
    10.times do
        Dish.create(name: Faker::Food.unique.dish, restaurant_id: i.id)
    end
end

tag_array = ["spicy", "sweet", "low fat", "vegitarian", "cold", "hot", "savory", "salty", "peanuts", "eggs", "dairy", "good", "bad"]

10.times do |i|
    Tag.create(name: tag_array[i])
end


Dish.all.each do |dish|
    tag_selection = Tag.all
    3.times do
        rand_tag = tag_selection.sample
        DishTag.create(tag_id: rand_tag.id, dish_id: dish.id)
        tag_selection.delete(rand_tag)
    end
end