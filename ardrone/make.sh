rm -rf bin/
mkdir bin/

(cd motorboard && ./make.sh)
(cd navboard && ./make.sh)
(cd attitude && ./make.sh)
(cd vbat && ./make.sh)
(cd gpio && ./make.sh)
(cd video && ./make.sh)
(cd fly && ./make.sh)
