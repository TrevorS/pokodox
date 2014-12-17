require 'bundler'
Bundler.require

POKEZ = File.readlines('pokez.txt').map(&:chop)

get '/' do
  { status: :ok, count: POKEZ.count }.to_json
end

get '/pokez/:id' do
  id      = params[:id].to_i
  name    = POKEZ[id - 1]
  artwork = "http://img.pokemondb.net/artwork/#{name.sub('. ', '-').downcase}.jpg"
  { id: id, name: name, url: artwork }.to_json if id > 0 && id <= 152
end
