ansible \
  -i scram-rbac.yml control_center \
  -a "sudo systemctl restart confluent-control-center.service"
