target='/mnt/d/Backup/linuxprofile'

tar -czf "$target/home-$(date '+%Y-%m-%d_%H%M%S').tgz" --exclude=Oper --exclude=Devel /home/ameszely/

files=`ls $target -1 | wc -l`

while [ $files -gt 10 ]
do
  ls -td1 $target/* | tail -n 1 | xargs rm
  files=`ls $target -1 | wc -l`
done
