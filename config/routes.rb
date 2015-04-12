require 'api_version'  # lib/api_version.rb

Rails.application.routes.draw do
  ##
  # API (api namespace)
  # ===================
  #
  namespace :api, defaults: { format: 'json' } do
    scope module: :v1, constraints: ApiVersion.new('v1', true) do
      #
      #
      # Version One (v1)
      # ----------------
      # This is the default API verison. If no version is specified in the Accept
      # header, v1 will be returned. This is to encourage browser experimentation.
      #
      #
      # Includes the following resources:
      #
      #   * Legislation
      #   * Meetings
      #   * Data        ROOT data#index
      #
      resources :legislations, only: [:index, :show]
      resources :meetings, only: [:index, :show]
      root to: 'data#index'
    end
  end

  ##
  # Browser App (default namespace)
  # ===============================
  #
  # Includes the following resources:
  #
  #   * Legislation
  #   * Organizations
  #   * Statuses
  #   * Meetings        ROOT meetings#index
  #   * Search
  #   * Versions
  #
  resources :legislations
  resources :organizations
  resources :statuses
  resources :meetings
  scope '/meetings/:id' do
    get '/agenda',  to: 'meetings#agenda', as: 'agenda'
    get '/minutes', to: 'meetings#minutes', as: 'minutes'
    get '/in_progress',  to: 'meetings#start_meeting', as: 'start_meeting'
    get '/agenda/toggle',   to: 'meetings#toggle_agenda',  as: 'toggle_agenda'
    get '/minutes/toggle',  to: 'meetings#toggle_minutes', as: 'toggle_minutes'
  end
  get 'search', to: 'search#index', as: 'search'
  post 'versions/:id/revert', to: 'versions#revert', as: 'revert_version'

  root 'meetings#index'
end
