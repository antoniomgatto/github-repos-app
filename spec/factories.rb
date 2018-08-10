FactoryBot.define do
  factory :repository do
    name 'Name'
    full_name 'Full Name'
    html_url 'https://github.com/antoniomgatto'
    owner
  end

  factory :owner do
    login 'login'
    html_url 'https://github.com/antoniomgatto'
  end
end
