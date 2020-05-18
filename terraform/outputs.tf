resource "local_file" "master_ips" {
  count = var.launch_test_spot_instances ? 1 : 0

  filename = format("%s/scripts/master_ips.txt", path.module)

  content = <<EOF
%{for ip in aws_spot_instance_request.master_use1[*].private_ip~}
${ip}
%{endfor~}
%{for ip in aws_spot_instance_request.master_use2[*].private_ip~}
${ip}
%{endfor~}
%{for ip in aws_spot_instance_request.master_usw1[*].private_ip~}
${ip}
%{endfor~}
%{for ip in aws_spot_instance_request.master_usw2[*].private_ip~}
${ip}
%{endfor~}
EOF
}