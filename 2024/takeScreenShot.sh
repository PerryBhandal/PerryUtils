sleep 0.1
source /home/perry/.bashrc
rm -f /tmp/cur_shot.png
mate-screenshot -a > /tmp/cur_shot.png
xclip -i -selection c -t image/png /tmp/cur_shot.png

