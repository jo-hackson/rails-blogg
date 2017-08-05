
10.times.map do
  Article.create!( :title => Faker::Beer.name,
                   :text => Faker::ChuckNorris.fact
                 )
end

