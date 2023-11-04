resource "local_file" "foo" {
content = "Rala"
filename = "${path.module}/hello.name"
}
