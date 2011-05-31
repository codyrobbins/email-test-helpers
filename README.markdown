Email Test Helpers
==================

This gem provides some simple helpers for [RSpec](http://relishapp.com/rspec) and [Cucumber](http://cukes.info/) for testing ActionMailer deliveries.

Full documentation is at [RubyDoc.info](http://rubydoc.info/gems/email-test-helpers).

Usage
-----

Since I don’t know how to properly hook into RSpec or Cucumber’s namespaces, and in the interest of allowing this to work with things like [Spork](https://rubygems.org/gems/spork), you need to manually include the module. (If anyone knows a better way to do this, let me know!)

### RSpec

Place the following in `spec/spec_helper.rb`:

    include(CodyRobbins::EmailTestHelpers)

If you’re using Spork, it would go within your `Spork.prefork` block.

### Cucumber

Place the following in `features/support/email.rb`:

    World(CodyRobbins::EmailTestHelpers)

Colophon
--------

### See also

If you like this gem, you may also want to check out: [Static Model](http://codyrobbins.com/software/static-model), [Active Model Email Validator](http://codyrobbins.com/software/active-model-email-validator), or [HTTP Error](http://codyrobbins.com/software/http-error).

### Tested with

* RSpec 2.6.0 — 20 May 2011
* Cucumber 0.10.3 — 20 May 2011

### Contributing

* [Source](https://github.com/codyrobbins/email-test-helpers)
* [Bug reports](https://github.com/codyrobbins/email-test-helpers/issues)

To send patches, please fork on GitHub and submit a pull request.

### Credits

© 2011 [Cody Robbins](http://codyrobbins.com/). See LICENSE for details.

* [Homepage](http://codyrobbins.com/software/email-test-helpers)
* [My other gems](http://codyrobbins.com/software#gems)
* [Follow me on Twitter](http://twitter.com/codyrobbins)