locals {
  common_tags={
    Project= var.project
    environment= var.environment
    Terraform = "true"

  }
  # Use a local to store the first two availability zones
  # The slice function takes the full list and returns a new list
  # containing the elements from index 0 up to (but not including) index 2.
  # The "names" attribute of the data source provides a list of AZ names.
  az_names = slice(data.aws_availability_zones.available.names, 0, 2)
}
