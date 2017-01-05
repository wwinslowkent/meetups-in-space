require 'sinatra'
require_relative 'config/application'
require 'pry'

set :bind, '0.0.0.0'  # bind to all interfaces

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  @meetups = Meetup.all
  erb :'meetups/index'
end

get '/meetups/:id' do
  mid = params['id']
  @meetup = Meetup.find(mid)
  @attendees = Attendee.where(meetup_id: mid)
  erb :'meetups/details'
end

get '/new' do
  erb :'meetups/form'
end

delete '/meetups/:id' do
  Attendee.find_by(user_id: session[:user_id], meetup_id: params['id'].to_i).destroy
  redirect '/meetups/' + params['id']
end

post '/meetups/:id' do
  Attendee.create(user_id: session[:user_id], meetup_id: params['id'])
  redirect '/meetups/' + params['id']
end



post '/new' do
  params[:name]

  Meetup.create(name: params[:name], location: params[:location], time: params[:time], date: params[:date], duration: params[:duration], description: params[:description], creator_id: session[:user_id])
end
