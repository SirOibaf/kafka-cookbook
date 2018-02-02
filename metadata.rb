name             "kkafka"
maintainer       "Jim Dowling"
maintainer_email "jdowling@kth.se"
license          "Apache v2.0"
description      'Installs/Configures/Runs kkafka. Karamelized version of https://github.com/mthssdrbrg/kafka-cookbook'
version          "0.4.0"

recipe            "kkafka::install", "Installs kafka binaries"
recipe            "kkafka::default", "Configures Kafka"
#link:<a target='_blank' href='http://%host%:11111/'>Launch the WebUI for Kafka Monitor</a>
recipe            "kkafka::monitor", "Helper webapp to monitor performance of kafka"
recipe            "kkafka::client", "Kafka client installation"
recipe            "kkafka::purge", "Removes and deletes Kafka"

depends "kagent"
depends "kzookeeper"
depends "ndb"
depends "java"
depends "conda"

%w{ ubuntu debian rhel centos }.each do |os|
  supports os
end

attribute "java/jdk_version",
          :description =>  "Jdk version",
          :type => 'string'

attribute "kkafka/authorizer_version",
          :description => "Hops Kafka Authorizer version",
          :type => 'string'

attribute "java/install_flavor",
          :description =>  "Oracle (default) or openjdk",
          :type => 'string'

attribute "kkafka/dir",
          :description => "Base directory to install kafka (default: /opt)",
          :type => 'string'

attribute "kkafka/user",
          :description => "user to run kafka as",
          :type => 'string'

attribute "kkafka/group",
          :description => "group to run kafka as",
          :type => 'string'

attribute "kafka/ulimit",
          :description => "ULimit for the max number of open files allowed",
          :type => 'string'

attribute "kkafka/offset_monitor/port",
          :description => "Port for Kafka monitor service",
          :type => 'string'

attribute "kkafka/memory_mb",
          :description => "Kafka server memory in mbs",
          :type => 'string'

attribute "kkafka/broker/advertised/listeners",
          :description => "Listeners to publish to ZooKeeper for clients to use, if different than the `listeners` config property. For example, INTERNAL://hops1:9091,EXTERNAL://hops1:9092",
          :type => 'string'

attribute "kkafka/broker/zookeeper_connection_timeout_ms",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/retention/hours",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/retention/size",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/message/max/bytes",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/num/network/threads",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/num/io/threads",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/num/recovery/threads/per/data/dir",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/num/replica/fetchers",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/queued/max/requests",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/socket/send/buffer/bytes",
          :description => "",
          :type => 'string'

attribute "kkafka/brattribute oker/socket/receive/buffer/bytes",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/sockeattribute t/request/max/bytes",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/num/partitionsattribute ",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/segment/bytesattribute ",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/roll/hoursattribute ",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/retention/hoursattribute ",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/retention/bytesattribute ",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/retention/check/interval/attribute ms",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/index/size/max/bytesattribute ",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/index/interval/bytesattribute ",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/flush/interval/messagesattribute ",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/flush/scheduler/interval/msattribute ",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/flush/interval/msattribute ",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/leader/imbalance/check/intervalattribute /seconds",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/leader/imbalance/per/broker/percentageattribute ",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/dir",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/flush/offset/checkpoint/interval/ms",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/message/format/version",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/offsets/topic/replication/factor",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/port",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/queued/max/requests",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/quota/consumer/default",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/quota/producer/default",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/replica/fetch/max/bytes",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/replica/fetch/min/bytes",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/replica/fetch/wait/max/ms",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/replica/high/watermark/checkpoint/interval/ms",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/replica/lag/time/max/ms",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/replica/socket/receive/buffer/bytes",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/replica/socket/timeout/ms",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/request/timeout/ms",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/zookeeper/session/timeout/ms",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/zookeeper/set/acl",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/replication/factor",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/cleaner/enable",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/log/cleaner/io/buffer/load/factor",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/security/inter/broker/protocol",
          :description => "",
          :type => 'string'

attribute "kkafka/inter/broker/protocol/version",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/rack",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/ssl/client/auth",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/ssl/key/password",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/ssl/keystore/location",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/ssl/keystore/password",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/ssl/truststore/location",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/ssl/truststore/password",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/authorizer/class/name",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/ssl/endpoint/identification/algorithm",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/principal/builder/class",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/zookeeper/synctime/ms",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/zookeeper/connectiontimeout/ms",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/zookeeper/sessiontimeout/ms",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/zookeeper/synctime/ms",
          :description => "",
          :type => 'string'

attribute "kkafka/broker/super/users",
          :description => "For example: User:dn0;User:glassfish",
          :type => 'string'

attribute "kkafka/broker/database/pool/prepstmt/cache/enabled",
          :description => "PreparedStatement of database pool of HopsAclAuthorizer enabled or not",
          :type => 'string'

attribute "kkafka/broker/database/pool/prepstmt/cache/size",
          :description => "PreparedStatement cache size of database pool",
          :type => 'string'

attribute "kkafka/broker/database/pool/prepstmt/cache/sql/limit",
          :description => "PreparedStatement sql cache limit of database pool",
          :type => 'string'

attribute "kkafka/broker/database/pool/size",
          :description => "Size of database pool for HopsAclAuthorizer",
          :type => 'string'

attribute "kkafka/broker/acl/polling/frequency/ms",
          :description => "Polling frequency of HopsKafkaAuthorizer to retrieve ACLs",
          :type => 'string'

attribute "kkafka/default/private_ips",
          :description => "Set ip addresses",
          :type => "array"

attribute "kkafka/default/public_ips",
          :description => "Set ip addresses",
          :type => "array"

attribute "kagent/enabled",
          :description => "'false' to disable. 'true' is default.",
          :type => 'string'

attribute "install/dir",
          :description => "Set to a base directory under which we will install.",
          :type => "string"

attribute "install/user",
          :description => "User to install the services as",
          :type => "string"
