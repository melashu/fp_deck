# frozen_string_literal: true

class ErrorMessageComponent < ViewComponent::Base
    def initialize(message:)
        @message = message
    end
end
