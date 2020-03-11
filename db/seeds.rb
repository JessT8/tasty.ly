# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(email: 'user1@test', password: 'password', password_confirmation: 'password')

cut_by_wolfgang_puck_owner = Owner.create(email: 'owner1@test', password: 'password', password_confirmation: 'password' );

cut_by_wolfgang_puck = Restaurant.create(name: "Cut By Wolfgang Puck", image_url:"https://rrsg.s3.amazonaws.com/wp-content/uploads/2018/09/22191311/FEATcut_MAIN.jpg", owner_id: cut_by_wolfgang_puck_owner.id)


open_farm_community = Restaurant.create(name:"Open Farm Community",image_url:"https://d22ir9aoo7cbf6.cloudfront.net/wp-content/uploads/sites/2/2017/11/Kampung-French-OFC-mussels-Honeycombers-Singapore.jpg", owner_id: cut_by_wolfgang_puck_owner.id)

Food.create([{name: "Watercress soup, soft organic egg, crispy kale, pita bread", restaurant_id: open_farm_community.id}, {name:
"Warm salad of broccolu, pine nuts, sugar snap peas, crumbled feta", restaurant_id: open_farm_community.id}, {name: "Garden pea soup, garden knife beans, jamon, super snap peas, pita bread", restaurant_id: open_farm_community.id}, {name: "Crispy Jurong frog legs, root vegetables & lemak inspired curry, garden curry leaves", restaurant_id: open_farm_community.id}, {name: "Steak tartare marinared with ginger chill, spring onion & coriander puree, garlic crouton, organic egg yolk ", restaurant_id: open_farm_community.id},{name: "Roasted king prawns, garden herb gremolata, compressed spring onions", restaurant_id: open_farm_community.id}, {name: "Coconut laksa barramundi, turmeric potato cake, baby bok choy", restaurant_id:open_farm_community.id},{name: "Red grouper burger, chucky tar tar sauce, picked cucumber, local green salad", restaurant_id: open_farm_community.id}, {name: "Roasted red snapper, calamansi & sasame cucumber salad, garden roselle & hibiscus ketchup pickled cucumber", restaurant_id: open_farm_community.id}, {name: "Braised lamb shank, homemade couscous, olives, capers, garden peas", restaurant_id: open_farm_community.id}, {name: "BBQ half chicken, sweet corn ragout, potato fondant, mustard frill salad", restaurant_id: open_farm_community.id}, {name:"Yogurt & southern woord dressed cauliflower, cumin, spiced pan crystal", restaurant_id: open_farm_community.id}, {name:"Local snake bean, abalone mushroom, fermented sugar cane dressing", restaurant_id: open_farm_community.id}, {name:"Smoked paprika buttered sweet corn, salted caramel popcorn, chimichurri", restaurant_id: open_farm_community.id}, {name:"Garden holy basil gnocchi, pickled okra, lemon grass dressing", restaurant_id:open_farm_community.id}, {name:"Rigatoni, local mushrooms, smoked pancetta, stilton, balsamic graze", restaurant_id: open_farm_community.id}, {name: "Saffron carnaroli risotto, chorizo, cuttlefish, green peas, crispy Serrano, ebi", restaurant_id:open_farm_community.id}, {name:
"48 hour Barolo braised oxtail strozzapreti, parmesan wafers, garden thyme", restaurant_id: open_farm_community.id}, {name:"Baby Caesar salad, poached chicken breast", restaurant_id: open_farm_community.id}, {name: "strozzapreti, tomato sauce, fresh sweet basil", restaurant_id: open_farm_community.id}, {name: "Rustic fish pie, fresh thyme from the garden", restaurant_id: open_farm_community.id}, {name: "Open-face lasagna, beef bolognese, bechamel", restaurant_id: open_farm_community.id}, {name: "Homemade trio of ice cream, sable cookies", restaurant_id:open_farm_community.id}, {name:"Pandan & banana custard, ginger biscuit, lemon grass sago, sugar cane sorbet", restaurant_id: open_farm_community.id},{name:"Caramalised mango, textires of coconut", restaurant_id: open_farm_community.id}, {name:"Lemon tart, sweet basil ice cream", restaurant_id: open_farm_community.id},{name:"Selection of matured cheese & condiments", restaurant_id: open_farm_community.id}])



Food.create([{name: "Kaluga Caviar", restaurant_id: cut_by_wolfgang_puck.id}, {name:
"Vietnamese Steak Sandwich \"Banh Tieu\"", restaurant_id: cut_by_wolfgang_puck.id}, {name: "Char Siew Pork Belly Buns", restaurant_id: cut_by_wolfgang_puck.id}, {name: "Steak & Rings", restaurant_id: cut_by_wolfgang_puck.id}, {name: "Mini kobe \"Sliders\" ", restaurant_id: cut_by_wolfgang_puck.id},{name: "Tuns Tattare \"Sandwiches\"", restaurant_id: cut_by_wolfgang_puck.id}, {name: "Hot \"Gougeres\"", restaurant_id:cut_by_wolfgang_puck.id},{name: "Crab Roll", restaurant_id: cut_by_wolfgang_puck.id}, {name: "Crisp French Fires", restaurant_id: cut_by_wolfgang_puck.id}, {name: "Tempura Onion Rings", restaurant_id: cut_by_wolfgang_puck.id}, {name: "Artisanal Cheeses", restaurant_id: cut_by_wolfgang_puck.id}, {name:"Prime Sirloin 'Steak Tartare,' Herb Aioli, Mustard", restaurant_id: cut_by_wolfgang_puck.id}])




owner2 = Owner.create(email: 'owner2@test', password: 'password', password_confirmation: 'password' )
Restaurant.create(name:"Melt Cafe",image_url:"https://sethlui.com/wp-content/uploads/2016/06/melt-cafe-singapore-buffet-2255.jpg", owner_id:owner2.id)

Restaurant.create(name:"Komala Vilas Restaurant",image_url:"https://zone-thebestsingapore-bhxtb9xxzrrdpzhqr.netdna-ssl.com/wp-content/uploads/2015/01/komala-vilas.jpg", owner_id: cut_by_wolfgang_puck_owner.id);

owner3 = Owner.create(email: 'owner3@test', password: 'password', password_confirmation: 'password' );
Restaurant.create(name:"Jaan",image_url:"https://www.top25restaurants.com/singapore/wp-content/uploads/2018/10/jaan-fine-dining-restaurant-singapore-marina-bay-views-best-restaurants-in-singapore.jpg",owner_id: owner3.id)

owner4 = Owner.create(email: 'owner4@test', password: 'password', password_confirmation: 'password' );
Restaurant.create(name:"Burnt Ends",image_url:"https://danielfooddiary.com/wp-content/uploads/2016/02/burntends.jpg", owner_id:owner4.id)

owner5 = Owner.create(email: 'owner5@test', password: 'password', password_confirmation: 'password' );
Restaurant.create(name:"Colony",image_url:"https://thepeakmagazine.com.sg/wp-content/uploads/2018/06/20161128-RitzCNY75962.jpg",owner_id: owner4.id)


owner6 = Owner.create(email: 'owner6@test', password: 'password', password_confirmation: 'password' );
Restaurant.create(name:"Fratini La Trattoria",image_url:"https://zone-thebestsingapore-bhxtb9xxzrrdpzhqr.netdna-ssl.com/wp-content/uploads/2017/10/Fratini-La-Trattoria.jpg",owner_id: owner6.id)


owner7 = Owner.create(email: 'owner7@test', password: 'password', password_confirmation: 'password' );
Restaurant.create(name:"Corner House",owner_id: owner7.id)


owner8 = Owner.create(email: 'owner8@test', password: 'password', password_confirmation: 'password' );
Restaurant.create(name:"Rhunarn Le Restaurant",image_url:"https://www.rhubarb.sg/wp-content/uploads/2014/06/Img-0439.jpg", owner_id:owner8.id)

owner9 = Owner.create(email: 'owner9@test', password: 'password', password_confirmation: 'password' );
Restaurant.create(name:"Carousel",image_url:"https://media-cdn.tripadvisor.com/media/photo-s/16/72/ec/75/lavish-seafood-spread.jpg", owner_id:owner9.id)

owner10 = Owner.create(email: 'owner10@test', password: 'password', password_confirmation: 'password' );
Restaurant.create(name:"Summer Pavilion",image_url:"https://4.bp.blogspot.com/-K-0DWXvC5wg/XL8ECJpo1VI/AAAAAAAEEmw/6ZpGIWn94AYa3K4yc31cmdEj_1NgGlCnwCLcBGAs/s1600/Ritz%2BCarlton.jpg", owner_id:owner10.id)

owner11 = Owner.create(email: 'owner11@test', password: 'password', password_confirmation: 'password' );
Restaurant.create(name:"Edge",image_url:"https://i.hungrygowhere.com/business/a1/32/12/00/edge_594x0_crop_594x372_fa0548b271.jpg", owner_id:owner11.id)