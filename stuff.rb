require 'rubygems'
require 'sinatra'

$food = ['food1', 'yummy' 'cereal', 'chicken', 'yogurt']

def dinner
	$food[rand($food.size)]
end

get '/dinner' do
	dinner
end

get '/add-dinner' do
	<<-FORM
	<form action="/add-dinner" method="post">
		dinner: <input type="text" name="dinner">
		<input type="submit">
	</form>

	#{$food}
	FORM
end

post '/add-dinner' do
	$food << params[:dinner]
	redirect to('/add-dinner')
end

get '/' do
	'Hello World'
end