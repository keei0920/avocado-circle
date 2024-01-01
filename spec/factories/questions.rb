FactoryBot.define do
  factory :question do
    title                { 'おすすめの〇〇について' }
    text                 { 'テストテストテスト' }
    solution             { 0 }

    user

    after(:build) do |message|
      message.image.attach(io: File.open('app/assets/images/logo.jpg'), filename: 'logo.jpg')
    end
  end
end
