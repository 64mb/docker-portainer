# !/bin/sh

MAIN_CSS=$(find /public -name 'main.*.css')

cat /public/main.css >>${MAIN_CSS}
