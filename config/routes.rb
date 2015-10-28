Rails.application.routes.draw do
  ##
  # API (api namespace)
  # ===================
  # http://api.troycitytracking.com/
  #
  namespace :api, path: '', constraints: { subdomain: 'api'} do
    api_version(module: 'V1',
                path: {value: 'v1'},
                defaults: {format: 'json'}, default: true) do
      resources :bills,         only: [:index, :show]
      resources :meetings,      only: [:index, :show]
      resources :organizations, only: [:index, :show]
      resources :people,        only: [:index, :show]
      root to: 'data#index'
    end
  end

  ##
  # Browser App (default namespace)
  # ===============================
  #
  # Includes the following resources:
  #
  #   * Bill
  #   * Organizations
  #   * Meetings        ROOT meetings#index
  #   * Search
  #   * Versions
  #
  resources :bills
  resources :organizations
  devise_for :users
  resources :people
  resources :meetings
  scope '/meetings/:id' do
    get '/agenda',          to: 'agenda#show',  as: 'agenda'
    get '/minutes',         to: 'minutes#show', as: 'minutes'
    get '/agenda/toggle',   to: 'agenda#edit',  as: 'toggle_agenda'
    get '/minutes/toggle',  to: 'minutes#edit', as: 'toggle_minutes'
    get '/in_progress',     to: 'meetings#start_meeting', as: 'start_meeting'
  end
  get 'search',               to: 'search#index', as: 'search'
  post 'versions/:id/revert', to: 'versions#revert', as: 'revert_version'

  root 'bills#index'
end
