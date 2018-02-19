require('sinatra')
require('sinatra/contrib/all')

require_relative('models/animals.rb')
require_relative('models/owners.rb')

#homepage
get "/" do
  erb(:home)
end

#index animals
get '/animals' do
  @animals = Animal.all()
  erb(:index_animals)
end

#index owners
get '/owners' do
  @owners = Owner.all()
  erb(:index_owners)
end

#create new animal
get "/animals/new" do
  erb(:new_pet)
end

post "/animals/new" do
  new_pet = Animal.new(params)
  new_pet.save()
  redirect to "/animals"
end

#create new owner
get "/owners/new" do
  erb(:new_owner)
end

post "/owners/new" do
  new_owner = Owner.new(params)
  new_owner.save()
  redirect to "/owners"
end




#delete
# post '/pizza-orders/:id/delete' do
#   PizzaOrder.delete(params[:id])
#   redirect to "/pizza-orders"
# end
#
# get '/pizza-orders/:id/edit' do
#   @order = PizzaOrder.find(params[:id])
#   @toppings = ["Margherita", "Vegetarian", "Italian Sausage", "Pepperoni"]
#   erb(:edit)
# end
#
# post '/pizza-orders/:id' do
#   order = PizzaOrder.new(params)
#   order.update()
#   redirect to "/pizza-orders"
# end
