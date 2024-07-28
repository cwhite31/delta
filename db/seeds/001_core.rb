# Users
ap "Creating developer user ..."
User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!("users")
User.create!(
  email: "cwhite31@gmail.com",
  password: "vk6kai",
  display_name: "Chris White",
  is_developer: true,
  is_administrator: true,
  created_by_user_id: 1,
)
