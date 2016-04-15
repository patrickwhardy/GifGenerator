FactoryGirl.define do
  factory :category do
    title
  end

  sequence :title, ["Surreal", "Cubist", "Impressionism"].cycle do |name|
    name
  end

  factory :gif do
    image_path
    category
  end

  sequence :image_path do |n|
    "https://robohash.org/#{n}"
  end
end
