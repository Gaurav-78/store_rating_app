# Ensure users exist before creating stores and ratings
admin = User.find_or_create_by!(email: "admin@example.com") do |user|
  user.name = "Administrator User Account"
  user.password = "Admin@1234"
  user.role = :admin
end

owner = User.find_or_create_by!(email: "owner@example.com") do |user|
  user.name = "Primary Store Owner User"
  user.password = "Owner@1234"
  user.role = :store_owner
end

user = User.find_or_create_by!(email: "user@example.com") do |user|
  user.name = "Registered Normal User"
  user.password = "User@1234"
  user.role = :normal
end

# Ensure store exists
store = Store.find_or_create_by!(name: "Best Marketplace Store", address: "123 Market St", owner_id: owner.id)

# Ensure rating exists
Rating.find_or_create_by!(user_id: user.id, store_id: store.id, value: 5)
