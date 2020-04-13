require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'


get '/' do 
    erb "Hello!"
end 

get '/about' do 
	
 	erb :about
end 

get '/visit' do 

 	erb :visit
end 

get '/contacts' do 
 	erb :contacts
end

post "/visit" do
	@user_name = params[:username]
	@phone = params[:phone]
	@data_time = params[:datetime]
	@name_master = params[:name]
	@color = params[:color]
    
    	hh = {:username =>"Введите имя!",
    		  :phone => "Введите номер!",
    		  :datetime => "Введите дату и время!"}	  
    		

    	@error = hh.select {|key,_| params[key] == ""}.values.join()

    	if @error != ""
    		return erb :visit
    	end	

   erb "Hello #{@user_name}"


    #insert into Users (Name,Phone,)
end 

post '/contacts' do 
 
require 'pony'
Pony.mail({
  
  :from => "sergeyyakovenko15@gmail.com",
  :body => params[:body],
  :to => "mvolynskih@gmail.com",
  :subject => " Sergey Yakovenko",
  :via => :smtp,
  :via_options => { 
    :address              => 'smtp.gmail.com', 
    :port                 => '587', 
    :enable_starttls_auto => true, 
    :user_name            => "sergeyyakovenko15@gmail.com", 
    :password             => "][poiuytrewq", 
    :authentication       => :plain,
    :domain               => 'localhost.localdomain'
}
})

erb "Сообщение отправленно!"
end

 



get '/admin' do 
		erb :login_form
end

post '/admin' do 
    @login = params[:login]
    @password = params[:password]

 		if @login == "admin"&& @password == "admin"
 			 
 			erb :welcome

 		else 
 			@massege = "Sorry, Error Password!!!"
 			erb :login_form
 		end 		


end
