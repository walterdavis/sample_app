FactoryGirl.define do
  factory :user do
    name     "Walter Davis"
    email    "waltd@wdstudio.com"
    password "foobar"
    password_confirmation "foobar"
  end
end