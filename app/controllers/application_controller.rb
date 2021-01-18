require 'sinatra/base'
require 'pry'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :super_hero
    end

    post '/teams' do
        @team = Team.new(name: params[:team][:name], motto: params[:team][:motto])
        @members = []
      params[:team][:members].each do |member|
        
        @members << Member.new(name: member[:name], power: member[:power], bio: member[:bio])
        
      end

        erb :team
    end


end
