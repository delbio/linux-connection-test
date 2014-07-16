command="sudo sh $(pwd)/ConnectionTest.sh > $(pwd)/tmp.txt 2<&1"
job="*/1 * * * * ${command}"
cat <(fgrep -i -v "$command" <(sudo crontab -l)) <(echo "$job") | sudo crontab -
sudo crontab -l
