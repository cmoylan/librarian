require "spec_helper"

describe Book do
  it { should belong_to(:bookshelf) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:author) }
end
