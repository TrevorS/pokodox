require 'bundler'
Bundler.require

POKEZ = File.readlines('pokez.txt').map(&:chop)

get '/' do
  { status: :ok, count: POKEZ.count }.to_json
end

get '/pokez/:id' do
  id = params[:id].to_i
  poke(id) if id > 0 && id <= 152
end

def artwork(name)
  "http://img.pokemondb.net/artwork/#{name.downcase}.jpg"
end

def poke(id)
  name = POKEZ[id - 1]
  { id: id, name: name, url: artwork(name) }.to_json
end
