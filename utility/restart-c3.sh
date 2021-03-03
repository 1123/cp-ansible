ansible \
  -i cluster-1.yml control_center \
  -a "sudo systemctl restart confluent-control-center.service"
