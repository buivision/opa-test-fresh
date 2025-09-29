package terraform

deny[reason] {
  some r
  input.resource_changes[r].type == "aws_instance"
  not startswith(input.resource_changes[r].change.after.instance_type, "t3.")
  reason := "EC2 instances must use the t3 instance type family for testing."
}
