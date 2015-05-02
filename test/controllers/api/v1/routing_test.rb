# TODO: Figure out how to test routes with subdomains
# require 'test_helper'
#
# module API
#   module V1
#     class RoutingTest < ActionController::TestCase
#       context 'API' do
#         setup { @request.host = 'http://api.example.com' }
#         context 'defaults' do
#           should 'return json' do
#             get api_v1_root_path
#             assert_equal Mime::JSON, response.content_type
#           end
#           should 'be v1'
#         end
#         context 'v1' do
#           context 'Data endpoint' do
#             should route(:get, '/v1').to('data#index', format: :json)
#           end
#           context 'Bills API endpoints' do
#             should route(:get, '/api/v1/bills').to(action: :index, format: :json)
#             should route(:get, '/api/v1/bills/1')
#                        .to(action: :show, id: 1, format: :json)
#           end
#           context 'Meetings endpoints' do
#             should route(:get, '/v1/meetings').to('meeting#index', format: :json)
#             should route(:get, '/v1/meetings/1')
#                        .to('meeting#show', id: 1, format: :json)
#           end
#           context 'Organizations API endpoints' do
#             should route(:get, '/api/v1/organizations').to(action: :index, format: :json)
#             should route(:get, '/api/v1/organizations/1')
#                        .to(action: :show, id: 1, format: :json)
#           end
#           context 'People API endpoints' do
#             should route(:get, '/api/v1/people').to(action: :index, format: :json)
#             should route(:get, '/api/v1/people/1')
#                        .to(action: :show, id: 1, format: :json)
#           end
#         end
#       end
#     end
#   end
# end
