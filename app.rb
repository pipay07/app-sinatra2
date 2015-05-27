require 'sinatra'
require 'sinatra/activerecord'

ActiveRecord::Base.establish_connection(
	:adapter => "sqlite3",
	:database => "database.db"
	)

class Lien < ActiveRecord::Base
end

get '/' do 
	@lien = Lien.all.order("created_at DESC")
	erb :index	
end


post '/' do 
	@lien = Lien.new(params[:liens]) 
	@lien.save
	redirect '/'
end


delete "/:id" do
  @liens = Lien.find(params[:id])
  @liens.destroy
  redirect "/"
end 