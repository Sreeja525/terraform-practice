output "vpc_id" {
    value = aws_vpc.main.id
  
}


output "availability_zone_names" {
  value = data.aws_availability_zones.available.names
}