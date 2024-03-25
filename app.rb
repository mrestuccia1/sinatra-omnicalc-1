require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:index)
end

get("/square/new") do
  erb(:square)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/random/new") do
  erb(:random)
end

get("/payment/new") do
  erb(:payment)
end

get("/square/results") do
  @num = params['user_number'].to_f
  @result = (@num**2).round(4)
  erb(:square_res)
end

get("/square_root/results") do
  @num = params['user_number'].to_f
  @result = Math.sqrt(@num).round(4)
  erb(:square_root_res)
end

get("/random/results") do
  
  @mini = params['user_min'].to_f
  @maxi = params['user_max'].to_f

  @result = (@mini + rand * (@maxi - @mini)).round(4)
  erb(:random_res)

end

get("/payment/results") do
  @apr = params["user_apr"].to_f
  @years = params["user_years"].to_f
  @present_value = params["user_pv"].to_f

  monthly_rate = @apr / 100 / 12
  @result = @present_value * (monthly_rate / (1 - (1 + monthly_rate) ** (-@years * 12)))
  erb(:payment_res)
end
