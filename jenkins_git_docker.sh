app=$1
file=`echo $1|awk -F '/' '{print $2}'`
if [ ! -d $file ]
then
    git clone https://github.com/cpati/$file.git
else
    git pull https://github.com/cpati/$file.git
fi

echo docker ps|grep $app|awk '{print $1}';
dockerProcess=`docker ps|grep $app|awk '{print $1}'`;
echo "chida"$dockerProcess
if [ -n "$dockerProcess" ]
then
docker stop $dockerProcess	
fi

docker run -p 5050:8080 -t $app &>/dev/null &

