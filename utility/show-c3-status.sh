ansible \
  -i scram-rbac-tls.yml control_center \
  -a "sudo systemctl status confluent-control-center.service"
