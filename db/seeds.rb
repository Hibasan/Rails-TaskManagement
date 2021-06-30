name = "お風呂の国"
email = "test01@email.com"
password  = "password"
admin = true
User.create!(name: name,email: email,password: password,admin: admin)

name = "red"
Label.create!(name: name)

name = "yellow"
Label.create!(name: name)

name = "blue"
Label.create!(name: name)

name = "green"
Label.create!(name: name)
