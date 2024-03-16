User.user.delete_all
Status.all.delete_all
TradingAccount.all.delete_all
puts "=======================Started====================="
TYPE = ["standard", "algo", "competition"]
PHASE = ["student", "practitioner", "master"]
20.times do 
    User.create!(first_name: Faker::Name.first_name,email: Faker::Internet.email, last_name: Faker::Name.last_name, user_name: Faker::Name.unique.first_name, password: "12345678")
end
puts "=======================Succssfuly create 20 users====================="

Status.create!(name: 'new')
Status.create!(name: 'ongoing')
Status.create!(name: 'not_passed')
Status.create!(name: 'passed')
Status.create!(name: 'in_review')
Status.create!(name: 'onboarding')
Status.create!(name: 'denied')
Status.create!(name: 'expired')
puts "=======================Succssfuly create 8 statuses====================="

100.times do
    TradingAccount.create!(name: Faker::FunnyName.unique.name, user_type: TYPE[rand(0..2)], phase: PHASE[rand(0..2)], status_id: Status.order("RANDOM()").last.id, started: rand(1..5).day.ago, ended: rand(1..5).day.ago, user_id: User.order("RANDOM()").last.id, size: rand(1..100)*1000, balance:rand(1..100)*1000,profit: rand(1..100)*100,equity: rand(1..100)*100, op: rand(1..1000), payouts: rand(1..10_000))
end
puts "=======================Succssfuly create 100 trading accounts====================="

puts "=======================Finished====================="





