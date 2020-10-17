FactoryBot.define do
  factory :user do
    nickname              {"kei"}
    email                 {"kkk@gmail.com"}
    password              {"1111111"}
    password_confirmation {"1111111"}
    first_name            {"a"}
    family_name           {"b"}
    first_name_kana       {"c"}
    family_name_kana      {"d"}
    birth_date            {"1995-10-12"}
    post_code             {"3270835"}
    prefecture_code       {9}
    city                  {"f"}
    house_number          {"g"}
    building_name         {"g"}
    phone_number          {"08000000000"}
  end
end
