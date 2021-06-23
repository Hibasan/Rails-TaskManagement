require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  before do
    sleep 0.5
    FactoryBot.create(:task1,title: 'task')
    FactoryBot.create(:task2)
    FactoryBot.create(:task3)
    FactoryBot.create(:task4)
    FactoryBot.create(:task5)
    FactoryBot.create(:task6)
    FactoryBot.create(:task7)
    visit tasks_path
  end

  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        sleep 1
        click_link '登録'
        fill_in 'task_title', with: '今日の晩御飯'
        fill_in 'task_content' ,with: 'なににしようかな'
        select '着手中' ,from: 'task_status'
        select '高' ,from: 'task_priority'
        fill_in 'task_limit' ,with: '002333/03/03'
        click_button 'commit'
        sleep 1
        accept_confirm 'この内容で登録します'
        sleep 1
        expect(page).to have_content 'タスクを追加しました'
        click_link '終了期限'
        expect(page).to have_content 'なににしようかな'
        expect(page).to have_content '今日の晩御飯'
        expect(page).to have_content '2333/03/03'
      end
    end
  end

  describe '一覧表示機能' do
    # context '一覧画面に遷移した場合' do
    #   it '作成済みのタスク一覧が表示される' do
    #     expect(page).to have_content 'task'
    #   end
    # end
    # context 'タスクが登録日時の降順に並んでいる場合' do
    #   it '登録日時の新しいタスクが一番上に表示される' do
    #     sleep 0.5
    #     click_link '登録日時'
    #     sleep 1
    #     tasks = all('.create')
    #     expect(tasks[0]).to have_content "2030/06/21"
    #   end
    # end
    # context 'タスクが終了期限の降順に並んでいる場合' do
    #   it '終了期限の遠いタスクが一番上に表示される' do
    #     click_link '終了期限'
    #     tasks = all('.limit')
    #     expect(tasks[0]).to have_content "2110/01/01"
    #   end
    # end
  end

  describe '詳細表示機能' do
  #   context '任意のタスク詳細画面に遷移した場合' do
  #     it '該当タスクの内容が表示される' do
  #       task = FactoryBot.create(:task)
  #       click_link '詳細'
  #       expect(page).to have_content 'うまい棒'
  #       expect(page).to have_content '今日の晩御飯'
  #     end
  #   end
  end

  describe 'タスク検索機能' do
    context 'タスク名で検索した場合' do
      it 'タスク名に検索文字が入った一覧が表示される' do
        fill_in 'title', with: 'ごはん'
        sleep 1
        click_button 'commit'
        tasks = all('.title')
        sleep 1
        expect(page).to have_content 'ごはん'
        expect(tasks.count).to eq 3
      end
    end
    context 'ステータスで検索した場合' do
      it 'ステータスが一致した一覧が表示される' do
        select '着手中' ,from: 'status'
        sleep 1
        click_button 'commit'
        sleep 1
        tasks = all('.title')
        expect(page).to have_content '着手中'
        expect(tasks.count).to eq 2
      end
    end
    context 'タスク名とステータスで検索した場合' do
      it 'タスク名(曖昧)とステータス(一致)のタスク一覧が表示される' do
        fill_in 'title', with: 'ごはん'
        select '着手中' ,from: 'status'
        sleep 1
        click_button 'commit'
        tasks = all('.title')
        sleep 1
        expect(page).to have_content 'ごはん'
        expect(page).to have_content '着手中'
        expect(tasks.count).to eq 1
      end
    end
  end

end
