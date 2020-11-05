after :categories do
  20.times do
    Author.create(
      first_name: FFaker::Name.first_name,
      last_name: FFaker::Name.last_name
    )
  end
end
