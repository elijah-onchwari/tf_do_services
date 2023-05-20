#-------------------------Obtain User's Local Public IP---------------------

data "external" "myipaddr" {
  program = ["bash", "-c", "curl -s 'https://ipinfo.io/json'"]
}
