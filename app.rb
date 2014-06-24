require_relative 'config/environment'

class Application < Sinatra::Base

  set :public_folder, "assets"

  get '/names.json' do
    content_type 'text/json'
    Person.all.to_json
  end

  get '/names/:start_with.json' do
    content_type 'text/json'
    letter = params[:start_with]
    Person.find_by_sql("SELECT * FROM people WHERE people.name LIKE '#{letter}%'").to_json
  end

  get '/' do
    erb :index
  end

  run!
end