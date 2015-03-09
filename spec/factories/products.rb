FactoryGirl.define do
  factory :product do
    title "My Product"
    description "My Product Description"

    factory :product_with_variants do
      transient do
        variants_count 2
      end

      after(:create) do |product, evaluator|
        create_list(:variant, evaluator.variants_count, product: product)
      end
    end
  end
end
