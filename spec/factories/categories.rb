FactoryBot.define do
  factory :category do
    user
    name { 'Category 1' }
    icon do
      io = File.open(Rails.root.join('spec', 'icons', 'grocery_icon.jpg'))
      filename = 'grocery_icon.jpg'
      content_type = 'image/jpeg'
      Rack::Test::UploadedFile.new(io, content_type, filename)
    end
  end
end
