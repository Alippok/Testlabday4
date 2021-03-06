require( 'minitest/autorun' )
require_relative( '../friends' )

class TestFriends < MiniTest::Test

  def setup

    @person1 = {
      name: "Rick",
      age: 12,
      monies: 1,
      friends: ["Jay","Keith","Marc", "Val"],
      favourites: {
        tv_show: "Friends",
        things_to_eat: ["charcuterie"]
      } 
    }
    
    @person2 = {
      name: "Jay",
      age: 15,
      monies: 2,
      friends: ["Keith"],
      favourites: {
        tv_show: "Scrubs",
        things_to_eat: ["soup","bread"]
      } 
    }

    @person3 = {
      name: "Val",
      age: 18,
      monies: 20,
      friends: ["Rick", "Jay"],
      favourites: {
        tv_show: "Pokemon",
        things_to_eat: ["ratatouille", "stew"]
      } 
    }

    @person4 = {
      name: "Keith",
      age: 18,
      monies: 20,
      friends: ["Rick", "Jay", "Marc"],
      favourites: {
        tv_show: "Pokemon",
        things_to_eat: ["spaghetti"]
      } 
    }

    @person5 = {
      name: "Marc",
      age: 20,
      monies: 100,
      friends: [],
      favourites: {
        tv_show: "Scrubs",
        things_to_eat: ["spinach"]
      } 
    }

    @people = [@person1, @person2, @person3, @person4, @person5]

  end

  def test_name
    assert_equal("Marc", @person5[:name])
  end
  
  def test_tv_show()
    result = tv_show(@person2)
    assert_equal("Scrubs", result)
  end

  def test_favourite_food()
    result = favourite_food(@person3, "pizza")
    assert_equal(false, result)
  end


  def test_add_friend()
    result = add_friend(@person4, "Garry", "John", "Bob", "Kerry")
    array= ["Rick", "Jay", "Marc", "Garry","John", "Bob", "Kerry" ]
    assert_equal(array, result)
  end

  def test_remove_friend()
    result = remove_friend(@person1, "Keith")
    array = ["Jay", "Marc", "Val"]
    assert_equal(array, result)
  end

  def test_add_money()
    result = add_money(@person1, @person2, @person3, @person4, @person5, :monies)
    assert_equal(143, result)
  end

  # def test_loan_money
  #   result = loan_money(@person5, @person2, 20)
  #   assert_equal(22, result)
  # end

  def test_1st_loan
    test_friend1 = @person2
    test_friend2 = @person4
    # string= "#{test_friend1[:name]}'s balance is now £#{test_friend1[:monies]} and #{test_friend2[:name]}'s balance is now £#{test_friend2[:monies]}"#The logic works as the results show amounts have changed
    result = loan_money(test_friend1, test_friend2, 2)#However, we are still tinkering with creating a 
    assert_equal( "Jay's balance is now £0 and Keith's balance is now £22" , result)#dynamic test.
  end

def test_set_fav_food()
  result = set_fav_food(@person2)
  assert_equal("soup, bread", result)
end

def test_set_fav_food()
  result = set_fav_food(@person3)
  assert_equal("Val: ratatouille, stew", result)
end

end







