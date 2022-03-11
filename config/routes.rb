Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
  get "contact" => "pages#contact"

  # Inertia routes without Rails controllers, see: https://inertiajs.com/routing
  inertia "about" => "About"
end
