FactoryBot.define do
  factory :task1 ,class: Task do
    title { 'test_title' }
    content { 'test_content' }
    status {'未着手'}
    priority {'低'}
    limit {'2100-01-01'}
    created_at {"2020-06-21"}
  end
  factory :task2 ,class: Task do
    title { '朝ごはん' }
    content { 'うまい棒' }
    status {'未着手'}
    priority {'低'}
    limit {'2100-01-01'}
    created_at {"2010-06-21"}
  end
  factory :task3 ,class: Task do
    title { '晩ごはん' }
    content { 'カロリーメイト' }
    status {'完了'}
    priority {'中'}
    limit {'2090-01-01'}
    created_at {"2030-06-21"}
  end
  factory :task4 ,class: Task do
    title { '昼ごはん' }
    content { '蒲焼さん太郎' }
    status {'着手中'}
    priority {'高'}
    limit {'2110-01-01'}
    created_at {"2000-06-21"}
  end
  factory :task5 ,class: Task do
    title { '朝トレ' }
    content { 'ジャンプ１０回' }
    status {'未着手'}
    priority {'高'}
    limit {'2095-01-01'}
    created_at {"1995-06-21"}
  end
  factory :task6 ,class: Task do
    title { '昼トレ' }
    content { '徒歩５０ｍ' }
    status {'着手中'}
    priority {'低'}
    limit {'2095-01-01'}
    created_at {"1995-06-21"}
  end
  factory :task7 ,class: Task do
    title { '夜トレ' }
    content { 'タイピング' }
    status {'完了'}
    priority {'高'}
    limit {'2095-01-01'}
    created_at {"1995-06-21"}
  end
end
