package terraform

deny[reason] {
    input.resource_changes[_].type == "aws_instance"
    not startswith(input.resource_changes[_].change.after.instance_type, "t3.")
    reason := "EC2 instances must use the t3 instance type family for testing."
}
