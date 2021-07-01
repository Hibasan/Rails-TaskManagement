FactoryBot.define do
  factory :task1 ,class: Task do
    title { 'test_title' }
    content { 'test_content' }
    status {'未着手'}
    priority {'低'}
    limit {'2100-01-01'}
    created_at {"2020-06-21"}
    user_id { (User.find_by(email: build(:user1).email) || FactoryBot.create(:user1)).id }
    # association :user, factory: :user1

    # after(:build) do |task|
    #   label = create(:label1)
    #   task.tasklabels << build(:tasklabel, task: task, label: label )
    #
    #   #<Task id: nil, title: "task", content: "test_content", created_at: "2020-06-20 15:00:00", updated_at: nil, limit: "2100-01-01", status: "未着手", priority: "低", user_id: 199>
    #   #<Label id: 103, name: "red", created_at: "2021-07-01 06:49:34", updated_at: "2021-07-01 06:49:34">
    # end

  end
  factory :task2 ,class: Task do
    title { '朝ごはん' }
    content { 'うまい棒' }
    status {'未着手'}
    priority {'低'}
    limit {'2100-01-01'}
    created_at {"2010-06-21"}
    user_id { (User.find_by(email: build(:user2).email) || FactoryBot.create(:user2)).id }
  end

  factory :task3 ,class: Task do
    title { '晩ごはん' }
    content { 'カロリーメイト' }
    status {'完了'}
    priority {'中'}
    limit {'2090-01-01'}
    created_at {"2030-06-21"}
    user_id { (User.find_by(email: build(:user1).email) || FactoryBot.create(:user1)).id }
  end

  factory :task4 ,class: Task do
    title { '昼ごはん' }
    content { '蒲焼さん太郎' }
    status {'着手中'}
    priority {'高'}
    limit {'2110-01-01'}
    created_at {"2000-06-21"}
    user_id { (User.find_by(email: build(:user1).email) || FactoryBot.create(:user1)).id }
  end
  factory :task5 ,class: Task do
    title { '朝トレ' }
    content { 'ジャンプ１０回' }
    status {'未着手'}
    priority {'高'}
    limit {'2095-01-01'}
    created_at {"1995-06-21"}
    user_id { (User.find_by(email: build(:user1).email) || FactoryBot.create(:user1)).id }
  end

  factory :task6 ,class: Task do
    title { '昼トレ' }
    content { '徒歩５０ｍ' }
    status {'着手中'}
    priority {'低'}
    limit {'2095-01-01'}
    created_at {"1995-06-21"}
    user_id { (User.find_by(email: build(:user1).email) || FactoryBot.create(:user1)).id }
  end

  factory :task7 ,class: Task do
    title { '夜トレ' }
    content { 'タイピング' }
    status {'完了'}
    priority {'高'}
    limit {'2095-01-01'}
    created_at {"1995-06-21"}
    user_id { (User.find_by(email: build(:user1).email) || FactoryBot.create(:user1)).id }
  end
end
