require "rubygems"
require "sinatra"
require "sinatra/reloader" if development?
require "activerecord"

configure do
  ActiveRecord::Base.establish_connection(
    :adapter => 'mysql',
    :database => 'rest_demo',
    :username => 'root',
    :password => 'passw0rd'
  )
end

before do
  content_type "application/json"
end

not_found do
  status 404
  content_type "text/plain"
  "Quote not found."
end

get '/' do
  content_type "text/html"
  @quotes = Quote.all
  erb :home
end

get '/quotes' do
  Quote.all.to_json
end

post '/quotes' do
  quote = Quote.new(params[:quote])
  if quote.save
    quote.to_json
  else
    status 400 # Bad Request
    quote.errors.full_messages.to_json
  end
end

get '/quotes/:id' do
  quote = Quote.find_by_id(params[:id])
  not_found if quote.nil?
  quote.to_json
end

put '/quotes/:id' do
  quote = Quote.find_by_id(params[:id])
  if quote.update_attributes(params[:quote]) 
    quote.to_json 
  else
    status 400 # Bad Request
    quote.errors.full_messages.to_json
  end
end

delete '/quotes/:id' do
  quote = Quote.find_by_id(params[:id])
  not_found if quote.nil?
  if quote.destroy
    status 204 # No Content
  else
    status 400
  end
end

class Quote < ActiveRecord::Base
  include Rack::Utils
  attr_accessible :body, :author
  validates_presence_of :body, :author
  
  def body
    escape_html read_attribute(:body)
  end
  
  def author
    escape_html read_attribute(:author)
  end
end