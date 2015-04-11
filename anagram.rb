require 'rubygems'
require 'sinatra'
require 'json'

get '/anagram' do
  content_type :json
  if params[:w1] && params[:w2]
    status = params[:w1].downcase.chars.sort == params[:w2].downcase.chars.sort 
    {:status => status, :first_word => params[:w1], :second_word => params[:w2]}.to_json
  else
    { :status => "Incorrect URL, use the form: /anagram?w1=myfirstword&w2=mysecondword" }.to_json
  end
end
