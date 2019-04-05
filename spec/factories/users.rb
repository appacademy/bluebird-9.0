FactoryBot.define do
  factory :user do
    username { Faker::Movies::HarryPotter.unique.character }
    age { Random.rand(10..755) }
    email { Faker::Internet.unique.email }
    password { "hunter12" }

    factory :harry_potter do
      username { "Harry Potter, something" }
      age { Random.rand(10..17) }
      # email and password auto assigned *_*
    end 
  end
end