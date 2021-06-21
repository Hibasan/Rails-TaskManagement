# README

tasksテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null:false|
|content|text|null:false|
|created_at|datetime|null:false|
|updated_at|datetime|null:false|


#Herokuへのデプロイ方法
１．herokuへログイン
２．newアプリ、もしくはデプロイ済みのアプリを選択
３．Deployタブへ飛ぶ
４．Depeloyment method の Githubを選択
５．Githunbとアカウント連携をする
６．検索窓にGithubのアプリ名を入力
７．デプロイ候補が出てくるのでアプリをConnectする。
８．Automatic deploysのDeployBranch？を選択する
