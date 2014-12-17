require 'bundler'
Bundler.require

POKEZ = File.readlines('pokez.csv').map(&:chop).map { |e| e.split(',') }

get '/' do
  { status: :ok, count: POKEZ.count }.to_json
end

get '/pokez/:id' do
  id      = params[:id].to_i
  pokemon = POKEZ[id - 1]
  { id: id, name: pokemon[0], url: pokemon[1] }.to_json if id > 0 && id <= 152
end
