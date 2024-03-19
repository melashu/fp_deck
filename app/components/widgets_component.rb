# frozen_string_literal: true

class WidgetsComponent < ViewComponent::Base
  def initialize
     @statuses = Status.select(:id, :name)
  end
end
