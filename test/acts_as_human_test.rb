require File.dirname(__FILE__) + '/test_helper.rb' 

class ActsAsHumanTest < ActiveSupport::TestCase
  
  class User < ActiveRecord::Base
    acts_as_human
  end
  
  class Customer < ActiveRecord::Base
    acts_as_human :require_last_name => false
  end
  
  test "should require a first name" do
    user = create_user
    user.first_name = ''
    
    deny user.valid?, 'Should not be valid without a first name'
    assert_equal 'first name is required', user.errors[:first_name]
  end
  
  test "should have a first name that is less than 40 characters" do
    user = User.new(:first_name => 'aaaaabbbbbcccccdddddeeeeefffffggggghhhhhi')
    
    deny user.valid?
    assert_equal 'first name is too long (max 40 characters)', user.errors[:first_name]
  end
  
  test "should require a last name" do
    user = User.new(:first_name => 'Brent')
    
    deny user.valid?
    assert_equal 'last name is required', user.errors[:last_name]
  end
  
  test "should not require a last name if it is not required" do
    someone_else = Customer.new(:first_name => 'Brent')
    assert someone_else.valid?
  end
  
  test "should have a last name that is less than 40 characters" do
    user = create_user
    user.last_name = 'aaaaabbbbbcccccdddddeeeeefffffggggghhhhhi'
    
    deny user.valid?
    assert_equal 'last name is too long (max 40 characters)', user.errors[:last_name]
  end
  
  test "should have a last name when assigned through full name" do
    user = User.new(:full_name => 'Brent')
    
    deny user.valid?
    assert_equal 'last name is required', user.errors[:last_name]
  end
  
  test "should have a full name composed of first and last names" do
    user = User.new(:first_name => 'Brent', :last_name => 'Greeff')
    assert_equal 'Brent Greeff', user.full_name
  end
  
  test "should have a full name composed of first middle and last names" do
    user = User.new(:first_name => 'Brent', :middle_names => 'Middle Names', :last_name => 'Greeff')
    assert_equal 'Brent Middle Names Greeff', user.full_name
  end
  
  test "should assign first and last name when assigning to full name" do
    user = User.new(:full_name => 'Brent Greeff')
    
    assert_equal 'Brent', user.first_name
    assert_equal 'Greeff', user.last_name
  end
  
  test "should assign first last and middle names when assigning to full name" do
    user = User.new(:full_name => 'Brent Middle Names Greeff')
    
    assert_equal 'Brent', user.first_name
    assert_equal 'Middle Names', user.middle_names
    assert_equal 'Greeff', user.last_name
  end
  
  test "should have middle names that are less than 40 characters" do
    user = create_user
    user.middle_names = 'aaaaabbbbbcccccdddddeeeeefffffggggghhhhhi'
    
    deny user.valid?
    assert_equal 'middle names are too long (max 40 characters)', user.errors[:middle_names]
  end
  
  test "should have an empty full name when user is new" do
    user = User.new
    assert_equal '', user.full_name
  end
  
  test "should not allow non name like characters" do
    user = User.new(:full_name => "<Brent> Middle >< Names Gre&eff")
    
    deny user.valid?
    assert_equal 'some characters in your name are not allowed', user.errors[:first_name]
    assert_equal 'some characters in your name are not allowed', user.errors[:last_name]
    assert_equal 'some characters in your name are not allowed', user.errors[:middle_names]
  end
  
  private
  
  def create_user(options={})
    default_options = {
      :first_name => "Brent",
      :last_name => "Greeff"
    }
    
    return User.create!(default_options.merge(options))
  end
  
  def create_customer(options={})
    default_options = {
      :first_name => "Brent",
      :last_name => "Greeff"
    }
    
    return Customer.create!(default_options.merge(options))
  end
  
  def deny(expected_to_be_false, message = '')
    assert ! expected_to_be_false, message
  end
end
