if Rails.env.development?
  after :categories do
    8.times do
      Author.create(
        first_name: FFaker::Name.first_name,
        last_name: FFaker::Name.last_name
      )
    end
  end
end
