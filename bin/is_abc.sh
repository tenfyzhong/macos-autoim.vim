#!/usr/bin/env bash
#################################################################
#
#    file: is_abc.sh
#   brief:  
#  author: tenfyzhong
#   email: tenfy@tenfy.cn
# created: 2021-07-10 21:51:18
#
#################################################################

defaults read ~/Library/Preferences/com.apple.HIToolbox AppleSelectedInputSources | grep '"KeyboardLayout Name" = ABC;'
