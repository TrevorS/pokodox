require 'bundler'
Bundler.require

class Array
  def catch_em(id) { id: id, name: self[id - 1][0], url: self[id - 1][1] } end
  def catch_random() self.catch_em(rand(1..self.size)) end
end

POKEZ = File.readlines('pokez.csv').map(&:chop).map { |e| e.split(',') }

get '/' do
  json({ status: :ok, count: POKEZ.count })
end

get '/random' do
  json POKEZ.catch_random
end

get '/pokez/:id' do
  json POKEZ.catch_em(params[:id].to_i)
end
