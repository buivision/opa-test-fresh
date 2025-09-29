package terraform

# Boolean rule to check for violations
violation[r] {
  r := input.resource_changes[_]
  r.type == "aws_instance"
  not startswith(r.change.after.instance_type, "t3.")
}

# Deny messages derived from violations
deny[reason] {
  violation[_]
  reason := "EC2 instances must use the t3 instance type family for testing."
}
