Vim compilation options: ./configure --with-features=normal --disable-gui
apt-get install tmux vim fzf
make distclean && ./configure --with-features=normal --disable-gui && make -j12 && sudo make install
