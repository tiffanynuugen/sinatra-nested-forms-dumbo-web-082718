require './environment'

module FormsLab

  class App < Sinatra::Base

    get '/' do
      "Welcome to the Nested Forms Lab! let's navigate to the '/new'"
    end

    get '/new' do
      erb :"pirates/new"
    end

    post '/pirates' do
      @pirate = Pirate.new(params[:pirate][:name], params[:pirate][:weight], params[:pirate][:height])
      #@ship = Ship.new([:name], params[:type], params[:booty])
      @ships = params[:pirate][:ships].map do |ship|
        Ship.new(ship[:name], ship[:type], ship[:booty])
      end
      erb :"pirates/show"
    end


    # code other routes/actions here
  end

end
