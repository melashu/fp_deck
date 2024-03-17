class SearchFilter < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :status, optional: true
  
end
