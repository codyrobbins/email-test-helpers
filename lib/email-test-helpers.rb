require('rspec')

require('cody_robbins/email_test_helpers/methods')
require('cody_robbins/email_test_helpers/matchers')

RSpec.configure do |config|
  config.include(CodyRobbins::EmailTestHelpers::Methods)
  config.include(CodyRobbins::EmailTestHelpers::Matchers)
end
