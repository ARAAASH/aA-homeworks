# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([{username: 'pitt'}, {username: 'mercury'},
                      {username: 'jane'},
                      {username: 'king'},
                      {username: 'steve'}])

artworks = Artwork.create!([{title: 'cold sun', image_url: 'sunny.com', artist_id: users[0].id},
                          {title: 'winter bone', image_url: 'winterry.com', artist_id: users[2].id},
                          {title: 'useless gun', image_url: 'artngun.gov', artist_id: users[3].id}])

artwork_shares = ArtworkShare.create!([{artwork_id: artworks[1].id, viewer_id: users[1].id},
                                      {artwork_id: artworks[0].id, viewer_id: users[1].id},
                                      {artwork_id: artworks[2].id, viewer_id: users[4].id}])
