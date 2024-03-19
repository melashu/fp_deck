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
    @number_of_record = TradingAccount.where("user_type= ? and phase =? and status_id=?", @search_filter.user_type, @search_filter.phase, @search_filter.status_id).where(size: @search_filter.account_size_from..@search_filter.account_size_to).where(started: @search_filter.started).where(ended: @search_filter.ended).count
    respond_to do |format|
      format.turbo_stream
    end
  end


  private
  def search_params
    params.permit(:name, :user_type, :phase, :status_id, :user_id, :account_size_from, :account_size_to, :started,:ended,:balance_from, :balance_to)
  end
end
