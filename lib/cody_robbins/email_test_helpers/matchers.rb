module CodyRobbins
  module EmailTestHelpers
    module Matchers
      # @method be_sent_to(address)
      #
      # Verifies the address an email is sent to.
      #
      # @param address [String] The email address.
      #
      # @return [RSpec::Matchers::Matcher]
      #
      # @example
      #     last_email.should.be_sent_to 'dagny@taggart.com'
      RSpec::Matchers.define(:be_sent_to) do |address|
        match do |mail|
          mail.to.should == [address]
        end
      end

      # @method be_sent_from_address(address)
      #
      # Verifies the address an email is sent from.
      #
      # @param address [String] The email address.
      #
      # @return [RSpec::Matchers::Matcher]
      #
      # @example
      #     last_email.should.be_sent_from_address 'dagny@taggart.com'
      RSpec::Matchers.define(:be_sent_from_address) do |address|
        match do |mail|
          mail.from.should == [address]
        end
      end

      # @method be_sent_from_display_name(name)
      #
      # Verifies the display name an email is sent from. The display name is the optional text outside the angle brackets in a `From` header such as `Dagny Taggart <dagny@taggart.com>`.
      #
      # @param name [String] The display name.
      #
      # @return [RSpec::Matchers::Matcher]
      #
      # @example
      #     last_email.should.be_sent_from_display_name 'Dagny Taggart'
      RSpec::Matchers.define(:be_sent_from_display_name) do |name|
        match do |mail|
          mail[:from].display_names.should == [name]
        end
      end

      # @method be_sent_from(name, address)
      #
      # Verifies both the address and display name an email is sent from. This just combines the `be_sent_from_address` and `be_sent_from_display_name` matchers.
      #
      # @param name [String] The display name.
      # @param address [String] The email address.
      #
      # @return [RSpec::Matchers::Matcher]
      #
      # @example
      #     last_email.should.be_sent_from 'Dagny Taggart', 'dagny@taggart.com'
      RSpec::Matchers.define(:be_sent_from) do |name, address|
        match do |mail|
          mail.should be_sent_from_display_name name
          mail.should be_sent_from_address address
        end
      end
    end
  end
end
