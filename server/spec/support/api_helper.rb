module ApiHelper
include Rack::Test::Methods

def app
Rails.application
end

def jsonapi_style(hash)
resource_key = hash.first.first
resource_attributes = hash.first.last

return {
  data: {
    type: resource_key.to_s.pluralize,
    attributes: resource_attributes
  }
}
end

end

RSpec.configure do |config |
    config.include ApiHelper, type: : api# apply to all spec
  for
  apis folder
config.include Rails.application.routes.url_helpers, type: : api
end