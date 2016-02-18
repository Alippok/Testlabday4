# 1. For a given person, return their favourite tv show
# 2. For a given person, check if they like a particular food
# 3. Allow a new friend to be added to a given person
# 4. Allow a friend to be removed from a given person
# 5. Find the total of everyone's money
# 6. For two given people, allow the first person to loan a given value of money to the other
# 7. Find the set of everyone's favourite food joined together
# 8. Find people with no friends

# INSANE
# Find the people who have the same favourite tv show


def tv_show(person)
tv_show = person[:favourites][:tv_show]
return tv_show

end


def favourite_food(person, food)
  array = person[:favourites][:things_to_eat]
  for i in array
    if i == food
      return true
    end
  end
  return false
end

def add_friend(person, *new_friend)
  array = person[:friends]
  final_array = array.push(new_friend)
  
  return final_array.flatten
end


