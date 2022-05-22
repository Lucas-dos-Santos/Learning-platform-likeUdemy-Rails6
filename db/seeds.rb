User.create!(email: 'lucas.ffr2014@gmail.com', password: 'bravo5')

30.times do
  Course.create!([{
    title: Faker::Educator.course_name,
    description: Faker::TvShows::GameOfThrones.quote,
    user_id: User.first.id
  }])
end
