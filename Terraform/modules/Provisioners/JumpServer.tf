resource "null_resource" "JumpServerScript" {
  provisioner "local-exec" {
    command = "bash ${path.module}/Scripts/configJS.sh ${var.bastion_ip} ${var.private_ip} ${var.key_path}"
  }
}
