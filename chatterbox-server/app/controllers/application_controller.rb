class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get '/messages' do
    Message.all.order(created_at: :asc).to_json
  end

  post '/messages' do
    message = Message.create(body: params[:body], username: params[:username], created_at: Date.new, updated_at: Date.new)
    message.to_json
  end

  patch '/messages/:id' do
    patched_message = Message.find(params[:id])
    patched_message.update(body: params[:body], updated_at: Date.new)
    patched_message.to_json
  end

  delete '/messages/:id' do
    Message.find(params[:id]).destroy.to_json
  end
end