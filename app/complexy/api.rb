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
        Complexy::Repositories::User.new.all
      end

      desc 'Read user by id'
      get ':id' do
        Complexy::Repositories::User.new.find(params[:id])
      end
    end

    namespace :activities do
      desc 'Read activities'
      get do
        Complexy::Repositories::UserActivity.new.all
      end

      desc 'Read activity by user id'
      get ':user_id' do
        Complexy::Repositories::UserActivity.new.find_by_user_id(params[:user_id])
      end
    end

    namespace :user_info do
      desc 'Read user info by id'
      get ':id' do
        Complexy::Repositories::UserInfo.new.find_by_user_id(params[:id])
      end
    end
  end
end
