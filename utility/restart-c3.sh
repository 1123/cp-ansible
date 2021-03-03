ansible \
  -i scram-rbac-tls.yml control_center \
  -a "sudo systemctl restart confluent-control-center.service"
