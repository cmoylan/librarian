FactoryGirl.define do
  factory :location do |f|
    f.sequence(:name) { |n| "someplace#{n}" }
  end

  factory :bookshelf do |f|
    f.sequence(:name) { |n| "shelfy#{n}" }

    factory :bookshelf_with_location do
      # create a location with location factory and associate it
      location
    end
  end
end
