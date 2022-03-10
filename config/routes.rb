Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
  get "rails" => "pages#rails"

  resources :checklists do
    resources :checklist_items, module: :checklists, only: %i[create edit update destroy]
  end

  # Inertia routes without Rails controllers, see: https://inertiajs.com/routing
  inertia "about" => "About"
end
