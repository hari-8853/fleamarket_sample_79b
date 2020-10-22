FactoryBot.define do

  factory :item do
    name                {"foge"}
    introduction        {"aaa"}
    category_id            {"5"}
    item_condition_id      {"1"}
    postege_payer_id       {"3"}
    postage_tyep_id        {"4"}
    preparation_day_id     {"2"}
    price               {1111}

    after(:build) do |item|
      item.images {File.open("#{Rails.root}/public/images/test_images.jpeg")}
    end
  end

  factory :item_no_image, class: Item do
    name                {"foge"}
    introduction        {"aaa"}
    category_id            {"5"}
    item_condition_id      {"1"}
    postege_payer_id       {"3"}
    postage_tyep_id        {"4"}
    preparation_day_id     {"2"}
    price               {1111}
  end
end