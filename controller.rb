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

#delete animals
post '/animals/:id/delete' do
  Animal.delete(params[:id])
  redirect to "/animals"
end

#delete owners
post '/animals/:id/delete' do
  Owner.delete(params[:id])
  redirect to "/owners"
end

#update animals
get '/animals/:id/edit' do
  @animal = Animal.find(params[:id])
  @type = ["Cat", "Dog"]
  @owners = Owner.all()
  @adoptable = ["Yes", "No - Vet Care Needed", "No - Training Needed"]
  erb(:edit_animal)
end

post '/animals/:id/edit' do
  pet = Animal.new(params)
  pet.update
  redirect to "/owners"
end
