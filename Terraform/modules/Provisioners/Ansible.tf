resource "null_resource" "wait_for_ssh_bastion" {
  depends_on = [var.bastion_ip]

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ubuntu"
      host        = var.bastion_ip
      private_key = file(var.key_path)
      timeout     = "5m"
    }

    inline = ["echo 'Bastion is ready via SSH'"]
  }
}

resource "null_resource" "wait_for_ssh_private" {
  depends_on = [var.private_ip]

  provisioner "remote-exec" {
    connection {
      type         = "ssh"
      user         = "ubuntu"
      host         = var.private_ip
      private_key  = file(var.key_path)
      bastion_host = var.bastion_ip
      timeout      = "5m"
    }

    inline = ["echo 'Private instance is ready via SSH'"]
  }
}

resource "null_resource" "ansible_config_script" {
  provisioner "local-exec" {
    command = "bash ${path.module}/Scripts/configAnsible.sh ${var.bastion_ip} ${var.private_ip} ${var.key_path}"
  }
  depends_on = [null_resource.JumpServerScript,
    null_resource.wait_for_ssh_bastion,
  null_resource.wait_for_ssh_private]
}
