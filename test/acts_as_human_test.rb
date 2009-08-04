require File.dirname(__FILE__) + '/test_helper.rb' 

class ActsAsHumanTest < ActiveSupport::TestCase
  
  class User < ActiveRecord::Base
    acts_as_human
  end
  
  class Customer < ActiveRecord::Base
    acts_as_human :require_last_name => false
  end
  
  def test_should_require_a_first_name
    user = create_user
    user.first_name = ''
    
    deny user.valid?, 'Should not be valid without a first name'
    assert_equal 'first name is required', user.errors[:first_name]
  end
  
  def test_should_have_first_name_that_is_less_than_40_characters
    user = User.new(:first_name => 'aaaaabbbbbcccccdddddeeeeefffffggggghhhhhi')
    
    deny user.valid?
    assert_equal 'first name is too long (max 40 characters)', user.errors[:first_name]
  end
  
  def test_should_require_a_last_name
    user = User.new(:first_name => 'Brent')
    
    deny user.valid?
    assert_equal 'last name is required', user.errors[:last_name]
  end
  
  def test_should_not_require_a_last_name_if_not_required
    someone_else = Customer.new(:first_name => 'Brent')
    assert someone_else.valid?
  end
  
  def test_should_have_last_name_that_is_less_than_40_characters
    user = create_user
    user.last_name = 'aaaaabbbbbcccccdddddeeeeefffffggggghhhhhi'
    
    deny user.valid?
    assert_equal 'last name is too long (max 40 characters)', user.errors[:last_name]
  end
  
  def test_should_have_a_last_name_when_assigned_through_full_name
    user = User.new(:full_name => 'Brent')
    
    deny user.valid?
    assert_equal 'last name is required', user.errors[:last_name]
  end
  
  def test_should_have_full_name_composed_of_first_and_last_name
    user = User.new(:first_name => 'Brent', :last_name => 'Greeff')
    assert_equal 'Brent Greeff', user.full_name
  end
  
  def test_should_have_full_name_composed_of_first_middle_and_last_name
    user = User.new(:first_name => 'Brent', :middle_names => 'Middle Names', :last_name => 'Greeff')
    assert_equal 'Brent Middle Names Greeff', user.full_name
  end
  
  def test_should_assign_first_and_last_name_when_assigning_to_full_name
    user = User.new(:full_name => 'Brent Greeff')
    
    assert_equal 'Brent', user.first_name
    assert_equal 'Greeff', user.last_name
  end
  
  def test_should_assign_first_last_and_middle_names_when_assigning_to_full_name
    user = User.new(:full_name => 'Brent Middle Names Greeff')
    
    assert_equal 'Brent', user.first_name
    assert_equal 'Middle Names', user.middle_names
    assert_equal 'Greeff', user.last_name
  end
  
  def test_should_have_middle_names_that_are_less_than_40_characters
    user = create_user
    user.middle_names = 'aaaaabbbbbcccccdddddeeeeefffffggggghhhhhi'
    
    deny user.valid?
    assert_equal 'middle names are too long (max 40 characters)', user.errors[:middle_names]
  end
  
  def test_should_have_a_empty_full_name_when_user_is_new
    user = User.new
    assert_equal '', user.full_name
  end
  
  def test_should_not_allow_non_name_like_characters
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
