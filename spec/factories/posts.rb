FactoryGirl.define do
factory :post do
content "Content title"
description "Post"
user_id "1234"
end

factory :invalid_post, parent: :post do
content nil
end
end

