require 'rails_helper'

describe 'タスクモデル機能', type: :model do

  describe 'バリデーションのテスト' do
  #   context 'タスクのタイトルが空の場合' do
  #     it 'バリデーションにひっかかる' do
  #       task = Task.new(title: '', content: '失敗テスト')
  #       expect(task).not_to be_valid
  #     end
  #   end

  #   context 'タスクの詳細が空の場合' do
  #     it 'バリデーションにひっかかる' do
  #       task = Task.new(title: '朝ごはん', content: '')
  #       expect(task).not_to be_valid
  #     end
  #   end

  #   context 'タスクのタイトルと詳細に内容が記載されている場合' do
  #     it 'バリデーションが通る' do
  #       task = Task.new(title: '朝ごはん', content: 'うまい棒')
  #       expect(task).to be_valid
  #     end
  #   end

  end

  describe '検索機能' do
    # let!(:task1) { FactoryBot.create(:task1, title: 'トレーニング',status:'完了')}
    # let!(:task2) { FactoryBot.create(:task2, title: 'banana',status:'着手中')}
    # let!(:task3) { FactoryBot.create(:task3, title: 'トレーサー',status:'着手中')}
    # let!(:task4) { FactoryBot.create(:task4, title: 'apple',status:'完了')}
    # let!(:task5) { FactoryBot.create(:task5, title: 'トレンディ',status:'完了')}
    # let!(:task6) { FactoryBot.create(:task6, title: 'パントレー',status:'未着手')}
    # let!(:task7) { FactoryBot.create(:task7, title: 'トレーナー',status:'完了')}
    #
    # context 'scopeメソッドでタイトルのあいまい検索をした場合' do
    #   it "検索キーワードを含むタスクが絞り込まれる" do
    #     # task1のタイトルにトレがあったらtrue
    #     expect(Task.search_title('トレ')).to include(task1)
    #     # task2のタイトルにトレがなかったらtrue
    #     expect(Task.search_title('トレ')).not_to include(task2)
    #     # Taskのタイトルをトレで検索して一致するタスクが１つだったらtrue
    #     expect(Task.search_title('トレ').count).to eq 5
    #   end
    # end
    # context 'scopeメソッドでステータス検索をした場合' do
    #   it "ステータスに完全一致するタスクが絞り込まれる" do
    #     expect(Task.search_status('完了')).to include(task1)
    #     expect(Task.search_status('完了')).not_to include(task2)
    #     expect(Task.search_status('完了').count).to eq 4
    #
    #   end
    # end
    # context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
    #   it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
    #     # ここに内容を記載する
    #     expect(Task.search_title('トレ').search_status('完了')).to include(task1)
    #     expect(Task.search_title('トレ').search_status('完了')).not_to include(task2)
    #     # タイトルにトレが入って完了しているものが１つだったらtrue
    #     expect(Task.search_title('トレ').search_status('完了').count).to eq 3
    #   end
    # end
  end

end
