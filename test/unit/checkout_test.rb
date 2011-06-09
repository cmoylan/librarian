require 'test_helper'

class CheckoutTest < ActiveSupport::TestCase
  test "should not save without borrower" do
    checkout = Checkout.new :due => 'today'
    assert !checkout.save
  end

  test "should not save without due date" do
    checkout = Checkout.new :borrower => 'me'
    assert !checkout.save
  end
end
