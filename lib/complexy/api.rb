module Complexy
  class API < Grape::API
    format :json
    prefix :api

    get do
      { message: 'Hello, this is complexy service' }
    end

    namespace :users do
      desc 'Read users'
      get do
        Storage::User.all
      end

      desc 'Read user'
      get ':id' do
        Storage::User.find(params[:id])
      end
    end

    namespace :activities do
      desc 'Read activities'
      get do
      	Storage::UserActivity.all
      end
    end
  end
end
