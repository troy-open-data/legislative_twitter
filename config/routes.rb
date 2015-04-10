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
      #
      # API Endpoints  {format: 'json'}
      # -------------------------------
      #           Prefix Verb   URI Pattern                       Controller#Action
      # api_legislations GET    /api/legislations.json            api/v1/legislations#index
      #  api_legislation GET    /api/legislations/:id.json        api/v1/legislations#show
      #
      #     api_meetings GET    /api/meetings.json                api/v1/meetings#index
      #      api_meeting GET    /api/meetings/:id.json            api/v1/meetings#show
      #
      #         api_root GET    /api.json                         api/v1/data#index
      resources :legislations, only: [:index, :show]
      resources :meetings, only: [:index, :show]
      root to: 'data#index'
    end
  end

  ##
  # Browser App (default namespace)
  # ===============================
  #
  # The default namespace contains the following resources:
  #
  #   * Legislation
  #   * Meeting       ROOT meetings#index
  #   * Organization
  #   * Status
  #   * Search
  #   * Version
  #
  #
  # Legislation Routes
  # ------------------
  #           Prefix Verb   URI Pattern                            Controller#Action
  #     legislations GET    /legislations(.:format)                legislations#index
  #                  POST   /legislations(.:format)                legislations#create
  #  new_legislation GET    /legislations/new(.:format)            legislations#new
  # edit_legislation GET    /legislations/:id/edit(.:format)       legislations#edit
  #      legislation GET    /legislations/:id(.:format)            legislations#show
  #                  PATCH  /legislations/:id(.:format)            legislations#update
  #                  PUT    /legislations/:id(.:format)            legislations#update
  #                  DELETE /legislations/:id(.:format)            legislations#destroy
  resources :legislations
  #
  #
  # Meeting Routes
  # --------------
  #         Prefix Verb   URI Pattern                              Controller#Action
  #       meetings GET    /meetings(.:format)                      meetings#index
  #                POST   /meetings(.:format)                      meetings#create
  #    new_meeting GET    /meetings/new(.:format)                  meetings#new
  #   edit_meeting GET    /meetings/:id/edit(.:format)             meetings#edit
  #        meeting GET    /meetings/:id(.:format)                  meetings#show
  #                PATCH  /meetings/:id(.:format)                  meetings#update
  #                PUT    /meetings/:id(.:format)                  meetings#update
  #                DELETE /meetings/:id(.:format)                  meetings#destroy
  #
  #         agenda GET    /meetings/:id/agenda(.:format)           meetings#agenda
  #        minutes GET    /meetings/:id/minutes(.:format)          meetings#minutes
  #  start_meeting GET    /meetings/:id/notes(.:format)            meetings#start_meeting
  #
  #  toggle_agenda GET    /meetings/:id/agenda/toggle(.:format)    meetings#toggle_agenda
  # toggle_minutes GET    /meetings/:id/minutes/toggle(.:format)   meetings#toggle_minutes
  resources :meetings
  scope '/meetings/:id' do
    get '/agenda',  to: 'meetings#agenda', as: 'agenda'
    get '/minutes', to: 'meetings#minutes', as: 'minutes'
    get '/notes',   to: 'meetings#start_meeting', as: 'start_meeting'
    get '/agenda/toggle',   to: 'meetings#toggle_agenda',  as: 'toggle_agenda'
    get '/minutes/toggle',  to: 'meetings#toggle_minutes', as: 'toggle_minutes'
  end
  #
  #
  # Organization Routes
  # -------------------
  #            Prefix Verb   URI Pattern                              Controller#Action
  #     organizations GET    /organizations(.:format)                 organizations#index
  #                   POST   /organizations(.:format)                 organizations#create
  #  new_organization GET    /organizations/new(.:format)             organizations#new
  # edit_organization GET    /organizations/:id/edit(.:format)        organizations#edit
  #      organization GET    /organizations/:id(.:format)             organizations#show
  #                   PATCH  /organizations/:id(.:format)             organizations#update
  #                   PUT    /organizations/:id(.:format)             organizations#update
  #                   DELETE /organizations/:id(.:format)             organizations#destroy
  resources :organizations
  #
  #
  # Status Routes
  # -------------
  #      Prefix Verb   URI Pattern                              Controller#Action
  #    statuses GET    /statuses(.:format)                      statuses#index
  #             POST   /statuses(.:format)                      statuses#create
  #  new_status GET    /statuses/new(.:format)                  statuses#new
  # edit_status GET    /statuses/:id/edit(.:format)             statuses#edit
  #      status GET    /statuses/:id(.:format)                  statuses#show
  #             PATCH  /statuses/:id(.:format)                  statuses#update
  #             PUT    /statuses/:id(.:format)                  statuses#update
  #             DELETE /statuses/:id(.:format)                  statuses#destroy
  resources :statuses
  #
  #
  # Search Routes
  # -------------
  # Prefix Verb   URI Pattern                                   Controller#Action
  # search GET    /search(.:format)                             search#search
  get 'search', to: 'search#index', as: 'search'
  #
  #
  # Version Routes
  # --------------
  #         Prefix Verb   URI Pattern                           Controller#Action
  # revert_version POST   /versions/:id/revert(.:format)        versions#revert
  post 'versions/:id/revert', to: 'versions#revert', as: 'revert_version'
  #
  #
  # Site Root
  # ---------
  root 'meetings#index'
end
