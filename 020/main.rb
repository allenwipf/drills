require "sinatra"

get "/" do
    erb :home
end

get "/people" do
    erb :info
end