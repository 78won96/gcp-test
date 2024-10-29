resource "null_resource" "notify" {
  triggers = {
    value = sha1(jsonencode(local.payload)) # if the payload changes (version is baked into it), send another notification
  }
  provisioner "local-exec" {
    command = <<EOF
    curl -s -X POST '${var.endpoint}' --header 'Content-Type: application/json' -d '${jsonencode(local.payload)}'
EOF
  }
}
