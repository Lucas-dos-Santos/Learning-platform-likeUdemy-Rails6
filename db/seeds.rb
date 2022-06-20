# User.create!(email: 'lucas.ffr2014@gmail.com', password: 'bravo5')

30.times do
  Course.create!([{
    title: Faker::Educator.course_name,
    description: Faker::TvShows::GameOfThrones.quote,
    user_id: User.first.id,
    short_description: Faker::TvShows::GameOfThrones.quote,
    language: 0,
    level: 0,
    price: Faker::Number.between(from: 1000, to: 20000)
  }])
end
