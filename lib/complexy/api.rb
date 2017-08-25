module Complexy
  class API < Grape::API
    format :json
    prefix :api

    get do
      { message: 'Hello, this is complexy service' }
    end
  end
end
