Factory.define :location do |f|
  f.sequence(:name) { |n| "someplace#{n}" }
end

Factory.define :bookshelf do |f|
  f.sequence(:name) { |n| "shelfy#{n}" }
end
