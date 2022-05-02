#!/bin/sh
set -x

parament=$1

back_dir="fcitx5 kitty nvim sway wallpaper waybar"
config_dir=~/.config/

backup(){
    echo "Copy files start..."
    for dir in ${back_dir};do
        cp -r ${config_dir}$dir ./
    done
    echo "Copy done"

    echo "Auto add and commit"
    git add .
    git commit -m "update at $(date)"
    # push manually
    # git push
}

deploy(){
    for dir in $(ls -F | grep /);do
        echo "Deploy $dir now..."
        cp -r $dir ${config_dir}
    done
}

main(){
    case $parament in
        backup)
            backup
            ;;
        deploy)
            deploy
            ;;
        *)
            echo "parament error"
            echo "please attach correct parament"
            echo "for example: ./start.sh backup"
            ;;
    esac
}

main
