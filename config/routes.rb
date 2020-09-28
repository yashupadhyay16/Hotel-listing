Rails.application.routes.draw do

  namespace :api  do
    namespace :v1, :defaults => { format: 'json' } do
      resources :contacts
      resources :resumes

      resources :hotel_infos do
        resources :locations
      end

    end
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
