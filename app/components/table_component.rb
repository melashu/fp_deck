# frozen_string_literal: true

class TableComponent < ViewComponent::Base
  with_collection_parameter :trading_account

   def initialize(trading_account:)
      @trading_account = trading_account
   end
end
