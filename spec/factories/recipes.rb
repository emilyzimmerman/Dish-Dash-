FactoryBot.define do
  factory :recipe do
    name { "MyString" }
    content { "MyString" }
    image_path { "MyString" }
    user { nil }
  end
end
