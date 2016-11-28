# This is a dev script to compile the *.coffee files to their js counterpart.
# Written by GowanR

clear
coffee -w --output ./js/libs/ ./js/libs-coffee/
