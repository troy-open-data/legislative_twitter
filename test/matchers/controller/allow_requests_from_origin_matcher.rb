module Shoulda
  module Matchers
    module ActionController
      # The `allow_requests_from_origin` matcher tests the CORS configuration
      # of the resource associated with a request.
      #
      # You can specify the origin as a string:
      #
      #     # RSpec
      #     describe PostsController do
      #       describe 'GET #index' do
      #         before { get :index }
      #
      #         it { should allow_requests_from('*') }
      #       end
      #     end
      #
      #     # Test::Unit
      #     class PostsControllerTest < ActionController::TestCase
      #       context 'GET #index' do
      #         setup { get :index }
      #
      #         should allow_requests_from('*')
      #       end
      #     end
      #
      # @return [AllowRequestsFromOriginMatcher]
      #
      def allow_requests_from_origin(status)
        AllowRequestsFromOriginMatcher.new(status)
      end

      # @private
      class AllowRequestsFromOriginMatcher
        def initialize(origin)
          @origin = origin
        end

        def matches?(controller)
          @controller = controller
          correct_origin?
        end

        def failure_message
          "Expected #{expectation}"
        end
        alias_method :failure_message_for_should,
                     :failure_message

        def failure_message_when_negated
          "Did not expect #{expectation}"
        end
        alias_method :failure_message_for_should_not,
                     :failure_message_when_negated

        def description
          "allow requests from origin \"#{@origin}\""
        end

        protected

        def correct_origin?
          access_control_allow_origin == @origin
        end

        def access_control_allow_origin
          @controller.response.headers['Access-Control-Allow-Origin']
        end
        alias_method :allowed_origin, :access_control_allow_origin

        def expectation
          "allowed origin to be \"#{@origin}\", but was \"#{allowed_origin}\""
        end
      end
    end
  end
end
