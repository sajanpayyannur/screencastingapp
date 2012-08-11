FactoryGirl.define do

  factory :user do
    email 'user@mail.com'
    password 'testes'
    nickname 'user'
    name 'User'
    description 'Whatever'

    trait :admin do
      roles { |a| [a.association(:role, name: 'admin')] }
    end
  end

  factory :role do
    name 'admin'
  end

  factory :page, class: Admin::Page do
    title 'The title'
    text 'Goes the content'
    publish true
  end

  factory :admin_menu_entry, class: Admin::MenuEntry do
    order 1
    title 'home'
    association :admin_page, factory: :page
  end

  factory :message do
    from 'from@mail.com'
    body 'hey'
  end
end
