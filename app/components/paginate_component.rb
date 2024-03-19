# frozen_string_literal: true

class PaginateComponent < ViewComponent::Base
   def initialize(pagy:)
      @pagy = pagy
   end
end
