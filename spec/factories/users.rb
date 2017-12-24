require 'faker'
FactoryBot.define do 
	factory :user, class: 'User' do |f|
		f.first_name { Faker::Name.first_name }
	end
end