FactoryGirl.define do
  factory :user, class: Complexy::Storage::User do
    first_name 'john'
    last_name 'lajoe'
  end
end
