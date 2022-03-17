FactoryBot.define do
  factory :user do
    email                 {'xyz@example'}
    password              {'123abc'}
    password_confirmation {password}
    nickname              {'furi'}
    last_name             {'亜'}
    first_name            {'伊'}
    last_pronounce        {'ア'}
    first_pronounce       {'イ'}
    birth_day             {'1930-11-11'}
  end
end