require 'rails_helper'

FactoryBot. define do 
	factory :user do |f|
		f.first_name { Faker::Name.first_name }
		f.email { Faker::Internet.email }
		f.password { Faker::Internet.password }
	end
end
RSpec.describe User, type: :model do 
	pending "add user specs"
	xit "is invalid without first_name" do 

	end

	it "has valid factory" do 
		expect(FactoryBot.create(:user)).to be_valid
	end
end