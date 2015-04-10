# config/initializers/jbuilder_prettify.rb
require 'jbuilder'

class Jbuilder
  ##
  # Forces Jbuilder to pretty_generate output
  def target!
    ::JSON.pretty_generate(@attributes)
  end
end
