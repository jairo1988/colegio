
def make_users
  admin = User.create!(:name => "Jairo Prats ",
                       :email => "al099507@uji.es",
                       :password => "fadrell22",
                       :password_confirmation => "fadrell22",
                       :tipo => "Administrador")
  admin.toggle!(:admin)
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(:name => name,
                 :email => email,
                 :password => password,
                 :password_confirmation => password)
  end
end


