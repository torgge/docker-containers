#!/bin/bash

wget https://download.jetbrains.com/fonts/JetBrainsMono-2.001.zip
unzip JetBrainsMono-2.001.zip /usr/share/fonts
fc-cache -f -v

