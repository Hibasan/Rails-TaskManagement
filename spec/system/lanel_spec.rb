require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  before do
    FactoryBot.create(:task1)
    FactoryBot.create(:task2)
    FactoryBot.create(:task3)
    FactoryBot.create(:task4)
    FactoryBot.create(:task5)
    FactoryBot.create(:task6)
    FactoryBot.create(:task7)
    visit new_user_path
    sleep 0.5
  end

  describe 'ラベルCRAD機能' do
    context 'タスクを新規作成でラベルを付与した場合' do
      it '詳細画面で付与したラベルが表示される' do
        admin_login
        click_link '登録'
        fill_in 'task_title', with: '今日の晩御飯'
        fill_in 'task_content' ,with: 'なににしようかな'
        select '着手中' ,from: 'task_status'
        select '高' ,from: 'task_priority'
        fill_in 'task_limit' ,with: '002333/03/03'
        check "red"
        check "blue"
        click_button 'commit'
        accept_confirm 'この内容で登録します'
        sleep 0.5
        click_link '終了期限'
        sleep 0.5
        page.all(".task-show")[0].click
        sleep 0.5
        expect(page).to have_content 'red'
        expect(page).to have_content 'blue'
      end
    end
    context 'タスク編集でラベルを変更した場合' do
      it '詳細画面で変更したラベルが表示される' do
        admin_login
        page.all(".task-edit")[0].click
        sleep 0.5
        uncheck "red"
        check "yellow"
        check "blue"
        check "green"
        click_button 'commit'
        sleep 0.5
        accept_confirm 'この内容で登録します'
        sleep 0.5
        page.all(".task-show")[0].click
        sleep 0.5
        expect(page).to have_content 'yellow'
        expect(page).to have_content 'blue'
        expect(page).to have_content 'green'
      end
    end
  end

  describe '詳細表示機能' do
    context '任意のタスク詳細画面に遷移した場合' do
      it '該当タスクのラベル内容が表示される' do
        admin_login
        page.all(".task-show")[2].click
        sleep 0.5
        expect(page).to have_content 'blue'
      end
    end
  end

  describe 'ラベル検索機能' do
    context 'ラベル名で検索した場合' do
      it 'ラベル名が合致したタスク一覧が表示される' do
        admin_login
        select 'red' ,from: 'label_id'
        sleep 0.5
        click_on 'ラベル検索'
        tasks = all('.task-title')
        sleep 0.5
        expect(tasks.count).to eq 3
      end
    end
  end
end

private
def admin_login
  click_link 'ログイン'
  fill_in 'session_email' ,with: 'test01@email.com'
  fill_in 'session_password' ,with: 'password'
  click_button 'commit'
  sleep 0.5
end
