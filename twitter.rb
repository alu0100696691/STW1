# -*- coding: utf-8 -*-
require 'twitter'
require 'sinatra'

require './configure'


get '/' do
  @seguidores = []
  @name = ''
  @number = 0		
  erb :twitter
end

post '/' do
  @seguidores = []
  client = my_twitter_client() 
  @name = params[:firstname] || ''
  @number = params[:n].to_i
  @number = 1 if @number <= 0
  if client.user? @name 
  	seguidores = Twitter.following(@name)
	numeroUsuarios = @number	
	#almacenar en el hash numero de seguidos con sus seguidores
	ordenado = Hash.new
  
	for x in seguidores
  		if numeroUsuarios > 0
    			ordenado[x.name] = x.followers_count  #metemos en el hash los amigos y numero de seguidores
    			numeroUsuarios = numeroUsuarios-1
  		end
	end

	@seguidores = ordenado.sort_by{|x| -x[1]}  #ordenamos(de mayor a menor)  y guardamos en seguidores
	
  	
  end
  erb :twitter
end
