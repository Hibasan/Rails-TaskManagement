require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  before do
    sleep 0.5
    @admin = FactoryBot.create(:task1,title: 'task')
    @user = FactoryBot.create(:task2)
    FactoryBot.create(:task3,user_id: @admin.user.id)
    FactoryBot.create(:task4,user_id: @admin.user.id)
    FactoryBot.create(:task5,user_id: @admin.user.id)
    FactoryBot.create(:task6,user_id: @admin.user.id)
    FactoryBot.create(:task7,user_id: @admin.user.id)
    visit new_user_path
    sleep 0.5
  end

  describe 'ユーザー登録のテスト' do
    context 'ユーザーが新規登録した場合' do
      it 'ログインしてタスク一覧が表示される' do
        fill_in 'user_name' , with: 'かるまる'
        fill_in 'user_email',with: 'test03@email.com'
        fill_in 'user_password',with: 'password'
        click_button 'commit'
        expect(page).to have_content 'タスク管理'
        expect(page).to have_content 'かるまる'
      end
    end
    context '未ログインでタスク一覧にアクセスした場合' do
      it 'ログイン画面に推移する' do
        click_link 'タスク一覧'
        expect(page).to have_content 'ログインしていません'
        expect(page).to have_content 'メールアドレス'
        expect(page).to have_content 'パスワード'
      end
    end
  end
  describe 'セッション機能のテスト' do
    context 'ユーザーがログインした場合' do
      it 'ログインしてタスク一覧が表示される' do
        click_link 'ログイン'
        fill_in 'session_email' ,with: 'test01@email.com'
        fill_in 'session_password' ,with: 'password'
        click_button 'commit'
        sleep 0.5
        expect(page).to have_content 'タスク管理'
        expect(page).to have_content 'お風呂の国'
      end
    end
    context 'タスク一覧からプロフィールに選択した場合' do
      it '自分のshow画面が表示すること' do
        click_link 'ログイン'
        fill_in 'session_email' ,with: 'test01@email.com'
        fill_in 'session_password' ,with: 'password'
        click_button 'commit'
        sleep 0.5
        click_link 'プロフィール'
        sleep 0.5
        expect(page).to have_content 'マイページ'
        expect(page).to have_content 'お風呂の国'
      end
    end
    context '他人の詳細画面に飛んだ場合' do
      it 'タスク一覧画面に推移すること' do
        click_link 'ログイン'
        fill_in 'session_email' ,with: 'test01@email.com'
        fill_in 'session_password' ,with: 'password'
        click_button 'commit'
        sleep 0.5
        click_link 'プロフィール'
        sleep 0.5
        visit user_path(100)
        expect(page).to have_content 'タスク管理'
        expect(page).to have_content 'お風呂の国'
      end
    end
    context 'ログアウトボタンを押した場合' do
      it 'セッションが切れてログイン画面に戻ること' do
        click_link 'ログイン'
        fill_in 'session_email' ,with: 'test01@email.com'
        fill_in 'session_password' ,with: 'password'
        click_button 'commit'
        sleep 0.5
        click_link 'ログアウト'
        sleep 0.5
        expect(page).to have_content 'ログインしていません'
        expect(page).to have_content 'ログアウトしました'
      end
    end
  end

  describe '管理画面のテスト' do
    context '管理ユーザーがログインしている場合' do
      it '管理画面にアクセスできること' do
        click_link 'ログイン'
        fill_in 'session_email' ,with: 'test01@email.com'
        fill_in 'session_password' ,with: 'password'
        click_button 'commit'
        sleep 0.5
        click_link 'ユーザー一覧'
        sleep 0.5
        expect(page).to have_content 'admin_user_index'
      end
    end
    context '管理ユーザーがログインしている場合' do
      it 'ユーザーの新規登録ができること' do
        click_link 'ログイン'
        fill_in 'session_email' ,with: 'test01@email.com'
        fill_in 'session_password' ,with: 'password'
        click_button 'commit'
        sleep 0.5
        click_link 'ユーザー一覧'
        sleep 0.5
        click_link 'ユーザー作成'
        sleep 0.5
        fill_in 'user_name',with: 'かるまる'
        fill_in 'user_email',with: 'test03@email.com'
        fill_in 'user_password',with: 'password'
        click_button 'commit'
        sleep 0.5
        expect(page).to have_content 'かるまる'
        expect(page).to have_content 'test03@email.com'
      end
    end
    context '管理ユーザーがログインしている場合' do
      it 'ユーザーの詳細画面にアクセスできること' do
        click_link 'ログイン'
        fill_in 'session_email' ,with: 'test01@email.com'
        fill_in 'session_password' ,with: 'password'
        click_button 'commit'
        sleep 0.5
        click_link 'ユーザー一覧'
        sleep 0.5
        page.all(".show")[1].click
        sleep 0.5
        expect(page).to have_content 'admin_show'
        expect(page).to have_content 'アスティル'
      end
    end
    context '管理ユーザーがログインしている場合' do
      it 'ユーザー情報を変更できること' do
        click_link 'ログイン'
        fill_in 'session_email' ,with: 'test01@email.com'
        fill_in 'session_password' ,with: 'password'
        click_button 'commit'
        sleep 0.5
        click_link 'ユーザー一覧'
        sleep 0.5
        page.all(".edit")[1].click
        sleep 0.5
        fill_in 'user_name',with: 'みうらの湯'
        fill_in 'user_email',with: 'test04@email.com'
        fill_in 'user_password',with: 'password'
        click_button 'commit'
        sleep 0.5
        expect(page).to have_content 'みうらの湯'
        expect(page).to have_content 'test04@email.com'
      end
    end
    context '管理ユーザーがログインしている場合' do
      it 'ユーザーを削除できること' do
        click_link 'ログイン'
        fill_in 'session_email' ,with: 'test01@email.com'
        fill_in 'session_password' ,with: 'password'
        click_button 'commit'
        sleep 0.5
        click_link 'ユーザー一覧'
        sleep 0.5
        page.all(".destroy")[1].click
        accept_confirm '削除します'
        sleep 0.5
        expect(page).to_not have_content 'アスティル'
        expect(page).to_not have_content 'test02@email.com'
      end
    end
    context '一般ユーザーがログインしている場合' do
      it '管理画面にアクセスできないこと' do
        click_link 'ログイン'
        fill_in 'session_email' ,with: 'test02@email.com'
        fill_in 'session_password' ,with: 'password'
        click_button 'commit'
        sleep 0.5
        visit admin_users_path
        sleep 0.5
        expect(page).to have_content '管理者以外はアクセスできません'
      end
    end
  end

  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        click_link 'ログイン'
        fill_in 'session_email' ,with: 'test01@email.com'
        fill_in 'session_password' ,with: 'password'
        click_button 'commit'
        sleep 0.5
        click_link '登録'
        fill_in 'task_title', with: '今日の晩御飯'
        fill_in 'task_content' ,with: 'なににしようかな'
        select '着手中' ,from: 'task_status'
        select '高' ,from: 'task_priority'
        fill_in 'task_limit' ,with: '002333/03/03'
        click_button 'commit'
        sleep 0.5
        accept_confirm 'この内容で登録します'
        sleep 0.5
        expect(page).to have_content 'タスクを追加しました'
        click_link '終了期限'
        sleep 0.5
        expect(page).to have_content 'なににしようかな'
        expect(page).to have_content '今日の晩御飯'
        expect(page).to have_content '2333/03/03'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        click_link 'ログイン'
        fill_in 'session_email' ,with: 'test01@email.com'
        fill_in 'session_password' ,with: 'password'
        click_button 'commit'
        sleep 0.5
        expect(page).to have_content 'task'
      end
    end
    context 'タスクが登録日時の降順に並んでいる場合' do
      it '登録日時の新しいタスクが一番上に表示される' do
        click_link 'ログイン'
        fill_in 'session_email' ,with: 'test01@email.com'
        fill_in 'session_password' ,with: 'password'
        click_button 'commit'
        sleep 0.5
        click_link '登録日時'
        sleep 0.5
        tasks = all('.create')
        expect(tasks[0]).to have_content "2030/06/21"
      end
    end
    context 'タスクが終了期限の降順に並んでいる場合' do
      it '終了期限の遠いタスクが一番上に表示される' do
        click_link 'ログイン'
        fill_in 'session_email' ,with: 'test01@email.com'
        fill_in 'session_password' ,with: 'password'
        click_button 'commit'
        sleep 0.5
        click_link '終了期限'
        sleep 0.5
        tasks = all('.limit')
        expect(tasks[0]).to have_content "210/01/01"
      end
    end
  end
  describe '詳細表示機能' do
    context '任意のタスク詳細画面に遷移した場合' do
      it '該当タスクの内容が表示される' do
        click_link 'ログイン'
        fill_in 'session_email' ,with: 'test01@email.com'
        fill_in 'session_password' ,with: 'password'
        click_button 'commit'
        sleep 0.5
        page.all(".show")[2].click
        sleep 0.5
        expect(page).to have_content '昼ごはん'
        expect(page).to have_content '蒲焼さん太郎'
      end
    end
  end
  describe 'タスク検索機能' do
    context 'タスク名で検索した場合' do
      it 'タスク名に検索文字が入った一覧が表示される' do
        click_link 'ログイン'
        fill_in 'session_email' ,with: 'test01@email.com'
        fill_in 'session_password' ,with: 'password'
        click_button 'commit'
        sleep 0.5
        fill_in 'title', with: 'ごはん'
        sleep 0.5
        click_button 'commit'
        tasks = all('.title')
        sleep 0.5
        expect(page).to have_content 'ごはん'
        expect(tasks.count).to eq 2
      end
    end
    context 'ステータスで検索した場合' do
      it 'ステータスが一致した一覧が表示される' do
        click_link 'ログイン'
        fill_in 'session_email' ,with: 'test01@email.com'
        fill_in 'session_password' ,with: 'password'
        click_button 'commit'
        sleep 0.5
        select '着手中' ,from: 'status'
        sleep 0.5
        click_button 'commit'
        sleep 0.5
        tasks = all('.title')
        expect(page).to have_content '着手中'
        expect(tasks.count).to eq 2
      end
    end
    context 'タスク名とステータスで検索した場合' do
      it 'タスク名(曖昧)とステータス(一致)のタスク一覧が表示される' do
        click_link 'ログイン'
        fill_in 'session_email' ,with: 'test01@email.com'
        fill_in 'session_password' ,with: 'password'
        click_button 'commit'
        sleep 0.5
        fill_in 'title', with: 'ごはん'
        select '着手中' ,from: 'status'
        sleep 0.5
        click_button 'commit'
        tasks = all('.title')
        sleep 0.5
        expect(page).to have_content 'ごはん'
        expect(page).to have_content '着手中'
        expect(tasks.count).to eq 1
      end
    end
  end

end
