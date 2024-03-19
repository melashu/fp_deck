class TradingAccount < ApplicationRecord
  belongs_to :status
  belongs_to :user

  # scope :user_name_scope {}

  def self.trading_account_list(params)
    scopes = []

  if params[:search_filter].present?
    query_data = params[:search_filter]
    scopes = SearchTradingAccount.call(query_data)
  end

  TradingAccount.includes(:user).includes(:status).where(scopes.any? ? scopes.reduce(&:merge) : {})
  end
end
