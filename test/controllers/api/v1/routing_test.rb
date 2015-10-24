require 'test_helper'

module API
  module V1
    class RoutingTest < ActionController::TestCase
      context 'API' do
        context 'defaults' do
          context 'v1' do
            # Should respond with json?
          end
          should 'default to v1' do
            assert_recognizes({ action: 'index',
                                controller: 'api/v1/data',
                                subdomain: 'api',
                                format: 'json' },
                              'http://api.example.com')
          end
        end

        context 'v1' do
          context 'Data API endpoint' do
            setup { @controller = API::V1::DataController }
            should route(:get, 'http://api.example.com/v1')
                     .to(action: :index, subdomain: 'api', format: :json)
          end

          context 'Bills API endpoints' do
            setup { @controller = API::V1::BillsController }
            should route(:get, 'http://api.example.com/v1/bills')
                     .to(action: :index, subdomain: 'api', format: :json)
            should route(:get, 'http://api.example.com/v1/bills/1')
                     .to(action: :show, id: 1, subdomain: 'api', format: :json)
          end

          context 'Meetings API endpoints' do
            setup { @controller = API::V1::MeetingsController }
            should route(:get, 'http://api.example.com/v1/meetings')
                     .to(action: :index, subdomain: 'api', format: :json)
            should route(:get, 'http://api.example.com/v1/meetings/1')
                     .to(action: :show, id: 1, subdomain: 'api', format: :json)
          end

          context 'Organizations API endpoints' do
            setup { @controller = API::V1::OrganizationsController }
            should route(:get, 'http://api.example.com/v1/organizations')
                     .to(action: :index, subdomain: 'api', format: :json)
            should route(:get, 'http://api.example.com/v1/organizations/1')
                     .to(action: :show, id: 1, subdomain: 'api', format: :json)
          end

          context 'People API endpoints' do
            setup { @controller = API::V1::PeopleController }
            should route(:get, 'http://api.example.com/v1/people')
                     .to(action: :index, subdomain: 'api', format: :json)
            should route(:get, 'http://api.example.com/v1/people/1')
                     .to(action: :show, id: 1, subdomain: 'api', format: :json)
          end
        end
      end
    end
  end
end
