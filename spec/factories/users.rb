FactoryBot.define do
  factory :user do
    nickname              {"フリマの小太郎"}
    email                 {"kkk@gmail.com"}
    password              {"1111111"}
    password_confirmation {"1111111"}
    first_name            {"小太郎"}
    family_name           {"降馬"}
    first_name_kana       {"コタロウ"}
    family_name_kana      {"フリマ"}
    birth_date            {"1995-10-12"}
    post_code             {"1500043"}
    prefecture_code       {13}
    city                  {"渋谷区道玄坂２丁目"}
    house_number          {"２３−１２"}
    building_name         {"フォンティスビル７F"}
    phone_number          {"08000000000"}
  end
end
