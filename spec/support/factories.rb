FactoryGirl.define do
  factory :gif do
    image_path
  end

  sequence :image_path do |n|
    "#{n}/image_path.gif"
  end
end
