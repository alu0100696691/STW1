Práctica/Taller: Contar la Popularidad de Nuestros Amigos en Twitter
==========================

**Autor:** *José Antonio Rodríguez Leandro*

**Fecha:** *24 Septiembre 2014*


Aplicación web en Sinatra que una vez obtenido el nombre del usuario muestre la lista de los amigos de ese usuario (esto es, a quienes sigue) ordenada según su popularidad (esto es, según el número de seguidores que tiene). Del mas popular al menos popular (no mas de 10 usuarios.


###La siguiente sesión pry muestra como obtener los seguidores de un usuario: 

```
[1] pry(main)> require 'twitter'
=> true
[2] pry(main)> require './configure'
=> true
[3] pry(main)> client = my_twitter_client()
=> #<Twitter::REST::Client:0x007fe972075e78
 @access_token="**********************",
 @access_token_secret="**********************",
 @consumer_key="**********************",
 @consumer_secret="**********************">
[5] pry(main)> seguidores = client.friend_ids("crguezl").attrs[:ids].take(10)
=> [476049040, 249595722,
 582620116, 546228347, 39973845,
 150456846, 79024273, 2693104332,
 2471387516, 1635283039]
```

###Versión final para contar nuestros amigos y sus seguidores ordenados de mayor a menor

```
#almacenar en el hash numero de seguidos con sus seguidores
ordenado = Hash.new

for x in seguidores
	if numeroUsuarios > 0
		ordenado[x.name] = x.followers_count  #metemos en el hash los amigos y numero de seguidores
		numeroUsuarios = numeroUsuarios-1
	end
end

@seguidores = ordenado.sort_by{|x| -x[1]}  #ordenamos(de mayor a menor)  y guardamos en seguidores

```
