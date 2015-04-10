Rails.application.routes.draw do
  ##
  # API (api namespace)
  # ===================
  #
  namespace :api, defaults: { format: 'json' } do
    resources :legislations, only: [:index, :show]
  end

  ##
  # Browser App (default namespace)
  # ===============================
  #
  # The default namespace contains the following resources:
  #
  #   * Legislation
  #   * Meeting
  #   * Organization
  #   * Status
  #   * Search
  #   * Version
  #
  # Prefixes, HTTP Verbs, URI Patterns, and associated controller actions are
  # listed for each set of resources (courtesy of rake routes).
  #
  # root: meetings#index (code at the end)
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
    get '/agenda'   => 'meetings#agenda',         as: 'agenda'
    get '/minutes'  => 'meetings#minutes',        as: 'minutes'
    get '/notes'    => 'meetings#start_meeting',  as: 'start_meeting'
    get '/agenda/toggle'  => 'meetings#toggle_agenda',  as: 'toggle_agenda'
    get '/minutes/toggle' => 'meetings#toggle_minutes', as: 'toggle_minutes'
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
  get 'search' => 'search#search', :as => :search
  #
  #
  # Version Routes
  # --------------
  #         Prefix Verb   URI Pattern                           Controller#Action
  # revert_version POST   /versions/:id/revert(.:format)        versions#revert
  post 'versions/:id/revert' => 'versions#revert', :as => 'revert_version'
  #
  #
  # Site Root
  # ---------
  root 'meetings#index'
end
