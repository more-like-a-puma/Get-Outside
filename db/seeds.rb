User.destroy_all
morelikeapuma = User.create :username => 'more_like_a_puma', :email => 'jwannabel@gmail.com', :name => 'Jessica May', :password => 'chicken', :password_confirmation => 'chicken'

Destination.destroy_all
bondibeach = Destination.create :address => 'Bondi Beach, Sydney, Australia', :country => 'Australia', :terrain => 'seascape', :description => 'World famous surf beach in the heart of Sydney, Australia.', :title => 'Bondi Beach'
bluemountains = Destination.create :address => 'Leura, Blue Mountains', :country => 'Australia', :terrain => 'mountain || forest', :description => 'mountain || forest', :title => 'Blue Mountains'
