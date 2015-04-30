##
# ApiVersion
# ==========
# Creates ApiVersion object for each version of the API;
# checks incoming Accept headers for which version to route to;
# sets marked version as default.
class ApiVersion
  def initialize(version, default = false)
    @version, @default = version, default
  end

  def matches?(request)
    @default || check_headers(request.header)
  end

  private

  def check_headers(headers)
    valid_header = "application/vnd.troycitycouncil.#{@version}+json"
    accept = headers['Accept']

    accept && accept.include?(valid_header)
  end
end
