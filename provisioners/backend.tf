terraform {
  backend "s3" {
    bucket = "sreevijay-remote-state"
    key    = "local-exec-provisioner"
    region = "us-east-1"
    encrypt = true
    use_lockfile   = true
  }
}