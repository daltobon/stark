Rails.application.routes.draw do
  root 'questions#index'
  devise_for :users 
  resources :questions do
  resources :answers 
  
end
   resources :comments

   post 'questions/:id/voteup' => 'questions#voteup', as: 'vote_question'
   post 'questions/:id/votedown' => 'questions#votedown', as: 'delete_vote'

   post 'answers/:id/voteup' => 'answers#voteup', as: 'vote_answer'
   post 'answers/:id/votedown' => 'answers#votedown', as: 'delete_voteanswer'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
