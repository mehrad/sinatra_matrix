require 'sinatra'
require 'matrix'

post '/product' do
    request.body.rewind  # in case someone already read it
    data = JSON.parse request.body.read
    "#{product_matrix(data)}!"
end

def product_matrix(params)
    first_array = params["data"].shift
    result = Matrix[*first_array]

    params["data"].each do |array|
      result = result * Matrix[*array]
    end

    result
end
