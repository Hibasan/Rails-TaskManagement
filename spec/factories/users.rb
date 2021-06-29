FactoryBot.define do
  factory :user1, class:User do
    name { 'お風呂の国' }
    email { 'test01@email.com' }
    password {'password'}
    admin {true}
  end
  factory :user2, class:User do
    name { 'アスティル' }
    email { 'test02@email.com' }
    password {'password'}
    admin {false}
  end

end
