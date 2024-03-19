# frozen_string_literal: true

class SearchFilterComponent < ViewComponent::Base
    def initialize(search_filter:, user:)
        @user = user
        @search_filter = search_filter
        @saved_filters = SearchFilter.all.map{|filter| [filter.name, filter.id]} << ["Saved Filters", "Saved Filters"]
        @statuses = Status.all.map{|status| [status.name, status.id]}
        @types = [["all", "all"], ["standard", "standard"], ["algo", "algo"], ["competition", "competition"]]
        @pases = [["all", "all"],["student", "student"], ["practitioner", "practitioner"], ["master", "master"]]
    end
end
