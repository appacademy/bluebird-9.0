FactoryBot.define do
  factory :user do
    username { Faker::Movies::HarryPotter.unique.character }
    age { Random.rand(10..755) } # Barry Winkle lived to 755
    political_affiliation { Faker::Movies::HarryPotter.house }
    email { Faker::Internet.unique.email }
    password { 'password' }

    factory :harry_potter do
      username { 'Harry Potter' }
      age { Random.rand(10..17) }
    end
  end
end
