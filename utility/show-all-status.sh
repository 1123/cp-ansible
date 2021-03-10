ansible -i cluster-1.yml kafka_broker -a "sudo systemctl"
ansible -i cluster-2.yml kafka_broker -a "sudo systemctl"
