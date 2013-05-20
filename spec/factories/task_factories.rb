FactoryGirl.define do
  sequence(:name) { |n| "Example name #{n}" }
  factory :task do
    name
    completed false
    
    factory :completed_task do
      completed true
    end
  end
end
