Rails.application.routes.draw do
  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  
  #user
  get '/users/new' => 'users#new', as: 'new_user'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show', as: 'user'
  get '/users' => 'users#index', as: '_users'

  #sessions
  get '/sessions/new' => 'sessions#new', as: 'new_session'
  post '/sessions' => 'sessions#create'
  get '/sessions' => 'sessions#delete'

  #surveys
  resources :surveys do
    #questions
    resources :questions
  end

  get "surveys/:id/showjson" => "surveys#showjson"

  get 'questions/:question_id/answers' => 'answers#index', as: "question_answers"
  post "questions/:question_id/answers" => 'answers#create'
  get 'questions/:question_id/answers/new' => 'answers#new', as: "new_question_answer"
  get 'questions/:question_id/answers/:id/edit' => 'answers#edit', as: "edit_question_answer"
  get  'questions/:question_id/answers/:id' => "answers#show", as: "question_answer"
  delete 'questions/:question_id/answers/:id' =>  "answers#destroy"
  put 'questions/:question_id/answers/:id'=> "answers#update"
end
