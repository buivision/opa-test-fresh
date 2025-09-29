package terraform

deny if {
  some r
  input.resource_changes[r].type == "aws_instance"
  not startswith(input.resource_changes[r].change.after.instance_type, "t3.")
}
