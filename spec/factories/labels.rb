FactoryBot.define do
  factory :label1, class: Label do
    name { 'red' }
  end
  factory :label2, class: Label do
    name { 'blue' }
  end
  factory :label3, class: Label do
    name { 'yellow' }
  end
  factory :label4, class: Label do
    name { 'green' }
  end
end
