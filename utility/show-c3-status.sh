ansible \
  -i scram-rbac.yml control_center \
  -a "sudo systemctl status confluent-control-center.service"
