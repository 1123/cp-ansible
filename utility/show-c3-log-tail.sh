ansible -i cluster-1.yml control_center -a "sudo tail -n 50 /var/log/confluent/control-center/control-center.log"
