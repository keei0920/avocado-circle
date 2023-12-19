FactoryBot.define do
  factory :avocado do
    name               { 'アボカド' }
    birth_day          { '2023-12-12' }
    watering           { '2023-12-12' }
    transplant         { '2023-12-12' }
    fertilizer         { '2023-12-12' }
    user
  end
end
