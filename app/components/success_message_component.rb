# frozen_string_literal: true

class SuccessMessageComponent < ViewComponent::Base
  def initialize(message:)
    @message = message
  end
end
