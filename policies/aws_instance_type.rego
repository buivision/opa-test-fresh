package terraform

# Deny if an aws_instance is not a t3.* type
deny {
  some r
  input.resource_changes[r].type == "aws_instance"
  print("Checking resource:", r)
  not startswith(input.resource_changes[r].change.after.instance_type, "t3.")
  print("Found violation at resource:", r, "with type:", input.resource_changes[r].change.after.instance_type)
}
