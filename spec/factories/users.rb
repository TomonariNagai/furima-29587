FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    firstname {Gimei.first.kanji}
    lastname {Gimei.last.kanji}
    firstname_kana {Gimei.first.katakana}
    lastname_kana {Gimei.last.katakana}
    birthday {Faker::Date.birthday}
  end
end
