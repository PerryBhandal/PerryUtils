# Script for installing OpenCV for Python3.5 on Ubuntu 16.04
# Based on tutorial by Adrian Rosebrock (http://www.pyimagesearch.com/2016/10/24/ubuntu-16-04-how-to-install-opencv/)

# Step 1: Install OpenCV dependencies on Ubuntu 16.04

#sudo apt-get install update; sudo apt-get upgrade

#sudo apt-get install build-essential cmake pkg-config

#sudo apt-get install libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev

#sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
#sudo apt-get install libxvidcore-dev libx264-dev

#sudo apt-get install libgtk-3-dev

#sudo apt-get install libatlas-base-dev gfortran

#sudo apt-get install python2.7-dev python3.5-dev

# Step 2: Download the OpenCV source

cd ~
wget https://github.com/Itseez/opencv/archive/3.2.0.zip .
unzip 3.2.0.zip

wget https://github.com/Itseez/opencv_contrib/archive/3.2.0.zip
unzip opencv_contrib.zip
