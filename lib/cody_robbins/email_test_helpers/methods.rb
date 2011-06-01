module CodyRobbins
  module EmailTestHelpers
    module Methods
      # A more readable alias for `ActionMailer::Base.deliveries`.
      #
      # @return [Array] All emails sent by ActionMailer.
      def emails
        ActionMailer::Base.deliveries
      end

      # @return [Mail::Message] The last email sent by ActionMailer.
      def last_email
        emails.first
      end
    end
  end
end
