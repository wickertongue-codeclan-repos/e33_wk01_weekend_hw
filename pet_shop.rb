require('pry')

def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
  return pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, amount)
  return pet_shop[:admin][:pets_sold] += amount
end

def stock_count(pet_shop)
  return pet_shop[:pets].length
end

def pets_by_breed(pet_shop, breed)
  pet_breeds_found = []
  for each_pet in pet_shop[:pets]
    if each_pet[:breed] == breed
      pet_breeds_found.push(breed)
    end
  end
  return pet_breeds_found
end

def find_pet_by_name(pet_shop, pet_name)
 # results_of_search = []
   for pet in pet_shop[:pets]
     if pet[:name] == pet_name
        return pet
     end
   end
   return nil
end

def remove_pet_by_name(pet_shop, pet_name)
  for each_pet in pet_shop[:pets]
    if each_pet[:name] == pet_name
      pet_shop[:pets].delete(each_pet)
    end
  end
  return nil
end

def add_pet_to_stock(pet_shop, pet_to_be_added)
  pet_shop[:pets].push(pet_to_be_added)
end

def customer_cash(customer_number)
  return customer_number[:cash]
end

def remove_customer_cash(customer_number, amount_removed)
  customer_number[:cash] -= amount_removed
  return customer_number[:cash]
end

def customer_pet_count(customer_number)
  return customer_number[:pets].count
end

def add_pet_to_customer(customer_number, new_pet)
  return customer_number[:pets].push(new_pet)
end

def customer_can_afford_pet(customer_number, new_pet)
  return customer_number[:cash] >= new_pet[:price]
end

def sell_pet_to_customer(pet_shop, pet, customer_number)
  if pet != nil && if customer_can_afford_pet(customer_number, pet)
    add_pet_to_customer(customer_number, pet)
      customer_pet_count(customer_number)
    increase_pets_sold(pet_shop, 1)
      pets_sold(pet_shop)
    remove_customer_cash(customer_number, pet[:price])
      customer_cash(customer_number)
    add_or_remove_cash(pet_shop, pet[:price])
      total_cash(pet_shop)
  end
end
end
