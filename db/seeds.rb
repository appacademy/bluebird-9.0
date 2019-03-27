# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do
  User.destroy_all

  users = []
  cynthia = User.create!(username: 'oh_ma_stars', email: 'oh_ma_stars@gmail.com')
  users << cynthia
  
  jennifer = User.create!(username: "that_fish", email: 'jenken@gmail.com')
  users << jennifer

  liz = User.create!(username: "queen_joob", email: 'queen_joob@gmail.com')
  users << liz
  
  andy = User.create!(username: 'wynk_wynk', email: 'wynk_wynk@gmail.com')
  users << andy

  andy_m = User.create!(username: 'the_real_andy', email: 'andym@gmail.com')
  users << andy_m
  
  mike = User.create!(username: 'squeakycheese', email: 'cheesecurds@gmail.com')
  users << mike

  dean = User.create!(username: 'call_me_matt', email: 'mattdean@gmail.com')
  users << dean

  rhonil = User.create!(username: "rho_yourboat", email: 'rho_yourboat@gmail.com')
  users << rhonil
  
  elliot = User.create!(username: "smelliot", email: 'smiz@gmail.com')
  users << elliot
  
  jesse = User.create!(username: "ma_man", email: 'not_a_pod_leader@gmail.com')
  users << jesse

  Chirp.destroy_all

  quotes = []

  until quotes.length == 13
    quotes << Faker::ChuckNorris.fact.slice(0, 140)
    quotes.uniq!
  end

  chirp1 = Chirp.create!(author_id: mike.id, body: quotes.pop)
  chirp2 = Chirp.create!(author_id: mike.id, body: quotes.pop)
  chirp3 = Chirp.create!(author_id: andy.id, body: quotes.pop)
  chirp4 = Chirp.create!(author_id: cynthia.id, body: quotes.pop)
  chirp5 = Chirp.create!(author_id: cynthia.id, body: quotes.pop)
  chirp6 = Chirp.create!(author_id: jennifer.id, body: quotes.pop)
  chirp7 = Chirp.create!(author_id: rhonil.id, body: quotes.pop)
  chirp8 = Chirp.create!(author_id: liz.id, body: quotes.pop)
  chirp9 = Chirp.create!(author_id: liz.id, body: quotes.pop)
  chirp10 = Chirp.create!(author_id: dean.id, body: quotes.pop)
  chirp11 = Chirp.create!(author_id: elliot.id, body: quotes.pop)
  chirp12 = Chirp.create!(author_id: andy.id, body: quotes.pop)
  chirp13 = Chirp.create!(author_id: jesse.id, body: quotes.pop)

  # Like.destroy_all

  # 20.times do
  #   begin
  #     Like.create!(user_id: User.all.sample.id, chirp_id: Chirp.all.sample.id)
  #   rescue => exception
  #   end
  # end
end