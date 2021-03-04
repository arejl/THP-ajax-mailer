require 'faker'

Task.all.destroy_all
Email.all.destroy_all

3.times do
  my_category = Category.create(title: Faker::Book.genre)
  3.times do
    my_task = Task.new(title: Faker::Book.title,
                      deadline: Faker::Date.forward(days: 23),
                      image: Faker::Avatar.image)
    my_task.category = my_category
    my_task.save
  end
end

5.times do
  Email.create!(object:Faker::TvShows::Friends.location, body:Faker::TvShows::Friends.quote, read:false)
end
