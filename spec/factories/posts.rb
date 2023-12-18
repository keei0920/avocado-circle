FactoryBot.define do
  factory :post do
    date                  { '2023-12-12' }
    condition_id         { 2 }
    text                  { 'テスト' }
    
    user

    after(:build) do |message|
      message.image.attach(io: File.open('app/assets/images/logo.jpg'), filename: 'logo.jpg')
    end
  end
end
