# frozen_string_literal: true

class SearchFilterComponent < ViewComponent::Base
    def initialize(search_filter:)
        @search_filter = search_filter
        @saved_filters = [["Saved Filters", "Saved Filters"]]
        @saved_filters << SearchFilter.all.map{|filter| [filter.name, filter.id]}
        @statuses = Status.all.map{|status| [status.name, status.id]}
        @types = [["all", "all"], ["standard", "standard"], ["algo", "algo"], ["competition", "competition"]]
        @pases = [["all", "all"],["student", "student"], ["practitioner", "practitioner"], ["master", "master"]]
    end
end
