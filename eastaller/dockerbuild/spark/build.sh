# file: build.sh
# date: 2020-12-31


apt-get update && apt-get install -y curl vim wget software-properties-common ssh net-tools wamerican wamerican-insane wbrazilian wdutch wbritish-large
apt-get install -y python3 python3-pip python3-numpy python3-matplotlib python3-scipy python3-pandas python3-simpy
update-alternatives --install "/usr/bin/python" "python" "$(which python3)" 1

curl -L -b "oraclelicense=a" -O http://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz
curl -L -O https://www-eu.apache.org/dist/spark/spark-2.3.2/spark-2.3.2-bin-hadoop2.7.tgz


mkdir -p /usr/local/oracle-java-8
tar -zxf jdk-8u191-linux-x64.tar.gz -C /usr/local/oracle-java-8/
rm  jdk-8u191-linux-x64.tar.gz
update-alternatives --install "/usr/bin/java" "java" "/usr/local/oracle-java-8/jdk1.8.0_191/bin/java" 1
update-alternatives --install "/usr/bin/javac" "javac" "/usr/local/oracle-java-8/jdk1.8.0_191/bin/javac" 1
update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/local/oracle-java-8/jdk1.8.0_191/bin/javaws" 1
export JAVA_HOME="/usr/local/oracle-java-8/jdk1.8.0_191"

mkdir -p /usr/local/spark-2.3.2
tar -zxf spark-2.3.2-bin-hadoop2.7.tgz -C /usr/local/spark-2.3.2/
rm spark-2.3.2-bin-hadoop2.7.tgz
update-alternatives --install "/usr/sbin/start-master" "start-master" "/usr/local/spark-2.3.2/spark-2.3.2-bin-hadoop2.7
update-alternatives --install "/usr/sbin/start-master" "start-master" "/usr/local/spark-2.3.2/spark-2.3.2-bin-hadoop2.7/sbin/start-master.sh" 1
update-alternatives --install "/usr/sbin/start-slave" "start-slave" "/usr/local/spark-2.3.2/spark-2.3.2-bin-hadoop2.7/sbin/start-slave.sh" 1
update-alternatives --install "/usr/sbin/start-slaves" "start-slaves" "/usr/local/spark-2.3.2/spark-2.3.2-bin-hadoop2.7/sbin/start-slaves.sh" 1
update-alternatives --install "/usr/sbin/start-all" "start-all" "/usr/local/spark-2.3.2/spark-2.3.2-bin-hadoop2.7/sbin/start-all.sh" 1
update-alternatives --install "/usr/sbin/stop-all" "stop-all" "/usr/local/spark-2.3.2/spark-2.3.2-bin-hadoop2.7/sbin/stop-all.sh" 1
update-alternatives --install "/usr/sbin/stop-master" "stop-master" "/usr/local/spark-2.3.2/spark-2.3.2-bin-hadoop2.7/sbin/stop-master.sh" 1
update-alternatives --install "/usr/sbin/stop-slaves" "stop-slaves" "/usr/local/spark-2.3.2/spark-2.3.2-bin-hadoop2.7/sbin/stop-slaves.sh" 1
update-alternatives --install "/usr/sbin/stop-slave" "stop-slave" "/usr/local/spark-2.3.2/spark-2.3.2-bin-hadoop2.7/sbin/stop-slave.sh" 1
update-alternatives --install "/usr/sbin/spark-daemon.sh" "spark-daemon.sh" "/usr/local/spark-2.3.2/spark-2.3.2-bin-hadoop2.7/sbin/spark-daemon.sh" 1
update-alternatives --install "/usr/sbin/spark-config.sh" "spark-config.sh" "/usr/local/spark-2.3.2/spark-2.3.2-bin-hadoop2.7/sbin/spark-config.sh" 1
update-alternatives --install "/usr/bin/spark-shell" "spark-shell" "/usr/local/spark-2.3.2/spark-2.3.2-bin-hadoop2.7/bin/spark-shell" 1
update-alternatives --install "/usr/bin/spark-class" "spark-class" "/usr/local/spark-2.3.2/spark-2.3.2-bin-hadoop2.7/bin/spark-class" 1
update-alternatives --install "/usr/bin/spark-sql" "spark-sql" "/usr/local/spark-2.3.2/spark-2.3.2-bin-hadoop2.7/bin/spark-sql" 1
update-alternatives --install "/usr/bin/spark-submit" "spark-submit" "/usr/local/spark-2.3.2/spark-2.3.2-bin-hadoop2.7/bin/spark-submit" 1
update-alternatives --install "/usr/bin/pyspark" "pyspark" "/usr/local/spark-2.3.2/spark-2.3.2-bin-hadoop2.7/bin/pyspark" 1
update-alternatives --install "/usr/bin/load-spark-env.sh" "load-spark-env.sh" "/usr/local/spark-2.3.2/spark-2.3.2-bin-hadoop2.7/bin/load-spark-env.sh" 
export SPARK_HOME="/usr/local/spark-2.3.2/spark-2.3.2-bin-hadoop2.7"



