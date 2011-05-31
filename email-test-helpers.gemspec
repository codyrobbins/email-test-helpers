Gem::Specification.new do |s|
  s.name     = 'email-test-helpers'
  s.version  = '1.0'
  s.summary  = 'Some helpers for RSpec and Cucumber for testing ActionMailer email delivery.'
  s.homepage = 'http://codyrobbins.com/software/email-test-helpers'
  s.author   = 'Cody Robbins'
  s.email    = 'cody@codyrobbins.com'

  s.post_install_message = '
-------------------------------------------------------------
Follow me on Twitter! http://twitter.com/codyrobbins
-------------------------------------------------------------

'

  s.files = `git ls-files`.split

  s.add_dependency('rspec', '>= 2')
end