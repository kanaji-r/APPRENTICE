#!/bin/bash

PASSWORDS_FILE="passwords.txt"

# 関数定義
add_info() {
    echo "サービス名を入力してください："
    read service_name
    echo "ユーザー名を入力してください："
    read user_name
    echo "パスワードを入力してください："
    read password
    gpg --quiet -d $PASSWORDS_FILE.gpg > $PASSWORDS_FILE
    rm $PASSWORDS_FILE.gpg
    echo "$service_name:$user_name:$password" >> $PASSWORDS_FILE
    echo "パスワードの追加は成功しました。"
    gpg -c $PASSWORDS_FILE
    rm $PASSWORDS_FILE
}

get_info() {
    echo "サービス名を入力してください："
    read search_service
    gpg --quiet -d $PASSWORDS_FILE.gpg > $PASSWORDS_FILE
    info=$(grep "^$search_service:" $PASSWORDS_FILE)
    rm $PASSWORDS_FILE
    if [ -z "$info" ]; then
      echo "そのサービスは登録されていません。"
    else
      show_service_name=$(echo "$info" | cut -d ":" -f 1)
      show_user_name=$(echo "$info" | cut -d ":" -f 2)
      show_password=$(echo "$info" | cut -d ":" -f 3)
      echo -e "サービス名：$show_service_name\nユーザー名：$show_user_name\nパスワード：$show_password"
    fi
}

# スクリプト本体
echo "パスワードマネージャーへようこそ！"

while true; do
  echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
  read choice

  case $choice in
    "Add Password")
      add_info
      ;;
    "Get Password")
      get_info
      ;;
    "Exit")
      echo "Thank you!"
      break
      ;;
    *)
      echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
      ;;
    esac
done
