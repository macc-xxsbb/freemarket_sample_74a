FactoryBot.define do

  factory :user do
    nickname              {"taro"}
    email                 {"aaa@gmail.com"}
    password              {"aaaaaaa"}
    family_name           {"山田"}
    first_name            {"太郎"}
    family_name_kana      {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birthdate             {"2000-01-01"}
    phone                 {"11111111111"}
  end

end