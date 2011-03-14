module ISBN

  class << self
    def find_isbn
      "123456789012"
    end

    def fetch_metadata(isbn)
      isbn
    end
  end
end

