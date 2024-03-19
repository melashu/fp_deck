require 'rails_helper'

RSpec.feature "TradingAccounts", type: :feature do
  let(:user) { create(:user) }
  let(:status) { create(:status, name: "denied") }
        
  let!(:trading_account) {create(:trading_account, size: 12000.0)}

  before do
    sign_in user
  end

  context 'when admin user logged in,' do
    it 'the logo  should be there' do
      visit root_path
      visit page.find("img.logo")[:src]
      expect(page).to have_http_status 200
    end

    it "user type, phase, user full name, size, status should be in the page" do
      visit root_path
      create(:trading_account, status: status, user:user, size: 12000.0 )
      expect(page).to have_content("$12,000.00")
      expect(page).to have_content(user.full_name)
      expect(page).to have_content("Standard")
      expect(page).to have_content("Student")
    end

    it "search filter input field should be there" do
      visit root_path
      expect(page).to have_selector("#saved_filter")
      expect(page).to have_selector("#search_filter_user_name")
      expect(page).to have_selector("#search_filter_user_type")
      expect(page).to have_selector("#search_filter_phase")
      expect(page).to have_selector("#search_filter_account_size_from")
      expect(page).to have_selector("#search_filter_account_size_to")
      expect(page).to have_selector("#search_filter_status_id")
      expect(page).to have_selector("#search_filter_started")
      expect(page).to have_selector("#search_filter_ended")
      expect(page).to have_selector("#search_filter_balance_from")
      expect(page).to have_selector("#search_filter_balance_to")
    end
  end
end
