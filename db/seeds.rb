Label.create!(name: "red")
Label.create!(name: "yellow")
Label.create!(name: "blue")
Label.create!(name: "green")

@user = User.create!(name: "お風呂の国",email: "test01@email.com",password: "password",admin: true)
@task = @user.tasks.create!(title:'朝ごはん',content:"うまい棒",status:"未着手",priority:"低",limit:'2100-01-01')
@task.labels << Label.find_by(name: "red")

@task = @user.tasks.create!(title:'昼ごはん',content:"コンソメ",status:"完了",priority:"高",limit:'2500-01-01')
@task.labels << Label.find_by(name: "yellow")

@task = @user.tasks.create!(title:'夜ごはん',content:"ポテトチップス",status:"完了",priority:"高",limit:'2400-01-01')
@task.labels << Label.find_by(name: "red")
@task.labels << Label.find_by(name: "blue")

@task = @user.tasks.create!(title:'朝ごはん',content:"うまい棒",status:"未着手",priority:"低",limit:'2100-01-01')
@task.labels << Label.find_by(name: "green")

@task = @user.tasks.create!(title:'朝トレーニング',content:"反復横跳び20回",status:"未着手",priority:"低",limit:'2100-01-01')
@task = @user.tasks.create!(title:'昼トレーニング',content:"ジャンプ5回",status:"未着手",priority:"低",limit:'2100-01-01')
@task = @user.tasks.create!(title:'夜トレーニング',content:"屈伸2回",status:"未着手",priority:"低",limit:'2100-01-01')

name = "アスティル"
email = "test02@email.com"
password  = "password"
admin = false
User.create!(name: name,email: email,password: password,admin: admin)

name = "かるまる"
email = "test03@email.com"
password  = "password"
admin = false
User.create!(name: name,email: email,password: password,admin: admin)
