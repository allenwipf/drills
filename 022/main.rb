require "sinatra"

get "/" do
  erb :home
end

get "/results" do
  erb :"#{params['query']}"
end

