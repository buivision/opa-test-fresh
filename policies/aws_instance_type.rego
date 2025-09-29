package terraform

deny {
  # Loop through resources by index
  input.resource_changes[_].type == "aws_instance"
  not startswith(input.resource_changes[_].change.after.instance_type, "t3.")
}
