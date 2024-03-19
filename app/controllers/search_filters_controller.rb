class SearchFiltersController < ApplicationController

  def create
    search_filter = SearchFilter.new(search_params)
    respond_to do |format|
      if search_filter.save
        format.turbo_stream
      else
        message = search_filter.errors.full_messages
        format.turbo_stream do
          render turbo_stream: turbo_stream.update('notification',
            ErrorMessageComponent.new(message:).render_in(view_context))
        end
      end
    end
  end

  def pre_populate
    id = params[:id]
    @search_filter = SearchFilter.find(id)
    scopes = SearchTradingAccount.call(@search_filter)
    @number_of_record = TradingAccount.includes(:user).includes(:status).where(scopes.any? ? scopes.reduce(&:merge) : {}).count
    respond_to do |format|
      format.turbo_stream
    end
  end


  private
  def search_params
    params.permit(:name, :user_type, :phase, :status_id, :user_id, :account_size_from, :account_size_to, :started,:ended,:balance_from, :balance_to)
  end
end
