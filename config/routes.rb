Echoprint::Application.routes.draw do
 

post 'upload' => 'home#upload'


root :to => 'home#index'

end