require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:my_database.db"

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

class Contact < ActiveRecord::Base
end

before do
	@barbers = Barber.all
end

get '/' do
	erb :index
end

get '/order' do
	erb :order
end

post '/order' do
	@name = params[:name]
	@phone = params[:phone]
	@datestamp = params[:datestamp]
	@barber = params[:barber]

	c = Client.new
	c.name = @name
	c.phone = @phone
	c.datestamp = @datestamp
	c.barber = @barber
	c.save

	erb :sent
end

get '/contacts' do
	erb :contacts
end

post '/contacts' do
	@name = params[:name]
	@comment = params[:comment]

	c = Contact.new
	c.name = @name
	c.comment = @comment
	c.save

	erb :sent_contacts
end