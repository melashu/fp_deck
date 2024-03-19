# frozen_string_literal: true

# include ActionDispatch::TestProcess
FactoryBot.define do
  factory :trading_account do
    user { association(:user) }
    status { association(:status) }
    name { "Seacrh for new student #{rand(1..1000)}" }
    user_type { 'Student' }
    phase { 'Standard'}
    size {rand(10_00.0..10_000.0).round(2) }
    started {20.days.ago.to_date}
    ended {5.days.ago.to_date}
    balance {rand(10_000.0..100_000.0).round(2) }
    profit {rand(10_000.0..100_000.0).round(2) }
    equity {rand(10_000.0..10_000.0).round(2) }
    op {rand(10_000.0..10_000.0).round(2) }
    payouts {rand(1_000.0..10_000.0).round(2) }
  end
end
