# frozen_string_literal: true

FactoryBot.define do
  sequence :email do |n|
    "user#{n}@fundingpips.com"
  end
  factory :user do
    first_name { 'Melashu' }
    last_name { 'Amare' }
    role { 'admin' }
    email { generate(:email) }
    user_name { generate(:email) }
    password { 'password123' }
    password_confirmation { 'password123' }
  end
end
