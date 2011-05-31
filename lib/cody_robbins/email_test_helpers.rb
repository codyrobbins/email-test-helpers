# encoding: UTF-8

module CodyRobbins
  # Usage
  # -----
  #
  # Since I don’t know how to properly hook into RSpec or Cucumber’s namespaces, and in the interest of allowing this to work with things like [Spork](https://rubygems.org/gems/spork), you need to manually include the module. (If anyone knows a better way to do this, let me know!)
  #
  # ### RSpec
  #
  # Place the following in `spec/spec_helper.rb`:
  #
  #     include(CodyRobbins::EmailTestHelpers)
  #
  # If you’re using Spork, it would go within your `Spork.prefork` block.
  #
  # ### Cucumber
  #
  # Place the following in `features/support/email.rb`:
  #
  #     World(CodyRobbins::EmailTestHelpers)
  #
  # RSpec matchers
  # --------------
  #
  # There are also some RSpec matchers which are documented here because Yard is unable to document them properly.
  #
  # ### be_sent_to
  #
  # Verifies the address an email is sent to.
  #
  #     last_email.should.be_sent_to 'dagny@taggart.com'
  #
  # ### be_sent_from_address
  #
  # Verifies the address an email is sent from.
  #
  #     last_email.should.be_sent_from_address 'dagny@taggart.com'
  #
  # ### be_sent_from_display_name
  #
  # Verifies the display name an email is sent from. The display name is the optional text outside the angle brackets in a `From` header such as `Dagny Taggart <dagny@taggart.com>`.
  #
  #     last_email.should.be_sent_from_display_name 'Dagny Taggart'
  #
  # ### be_sent_from
  #
  # Verifies both the address and display name an email is sent from. This just combines the `be_sent_from_address` and `be_sent_from_display_name` matchers.
  #
  #     last_email.should.be_sent_from 'Dagny Taggart', 'dagny@taggart.com'
  module EmailTestHelpers
    # A more readable alias for `ActionMailer::Base.deliveries`.
    #
    # @return [Array] All emails sent by ActionMailer.
    def emails
      ActionMailer::Base.deliveries
    end

    # @return [ActionMailer::Delivery] The last email sent by ActionMailer.
    def last_email
      emails.first
    end

    RSpec::Matchers.define(:be_sent_to) do |expected|
      match do |mail|
        mail.to.should == [expected]
      end
    end

    RSpec::Matchers.define(:be_sent_from_address) do |address|
      match do |mail|
        mail.from.should == [address]
      end
    end

    RSpec::Matchers.define(:be_sent_from_display_name) do |name|
      match do |mail|
        mail[:from].display_names.should == [name]
      end
    end

    RSpec::Matchers.define(:be_sent_from) do |name, address|
      match do |mail|
        mail.should.be_sent_from_display_name name
        mail.should.be_sent_from_address address
      end
    end
  end
end
