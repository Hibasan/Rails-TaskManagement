FactoryBot.define do
  factory :task1 ,class: Task do
    title { 'test_title' }
    content { 'test_content' }
    created_at {"2020-06-21"}
  end
  factory :task2 ,class: Task do
    title { '朝ごはん' }
    content { 'うまい棒' }
    created_at {"2010-06-21"}
  end
  factory :task3 ,class: Task do
    title { '晩ごはん' }
    content { 'カロリーメイト' }
    created_at {"2030-06-21"}
  end
  factory :task4 ,class: Task do
    title { '昼ごはん' }
    content { '蒲焼さん太郎' }
    created_at {"2000-06-21"}
  end

end
