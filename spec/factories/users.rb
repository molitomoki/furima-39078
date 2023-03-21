FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { '00000a' }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '陸太郎' }
    last_name_reading     { 'ヤマダ' }
    first_name_reading    { 'リクタロウ' }
    birth_day             { '1992-01-28' }
  end
end
