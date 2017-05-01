require 'sinatra/base'

class App < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :super_hero
  end

  post '/teams' do
    @team = params[:team]

    params[:team][:members].each do |member_info|
      SuperHero.new(member_info)
    end

    @superheroes = SuperHero.all

    erb :team
  end

end
