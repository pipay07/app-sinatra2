require 'sinatra'
require 'sinatra/activerecord'

ActiveRecord::Base.establish_connection(
	:adapter => "sqlite3",
	:database => "database.db"
	)

class Lien < ActiveRecord::Base
end

get '/' do 
 @liens = Lien.all.order("created_at DESC")
 erb :index	
end


post '/' do 
 @liens = Lien.new(params[:liens]) 
 @liens.save
 redirect '/'
end


delete "/:id" do
 @liens = Lien.find(params[:id])
 @liens.destroy
 redirect "/"
end 

put "/:id" do
 @liens = Lien.find(params[:id])
 @liens.update(params[:liens])
 redirect "/"
end
