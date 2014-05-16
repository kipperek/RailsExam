FactoryGirl.define do
factory :gist do
snippet "Snippet title"
lang "c"
description "Moja wrzutka"
user_id "123"
end

factory :invalid_gist, parent: :gist do
snippet nil
end
end



