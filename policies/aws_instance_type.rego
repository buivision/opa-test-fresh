package terraform

###########################################################
# Step 0: Confirm parsing works
# Minimal rule to test that TFC OPA can parse the file
parse_check if {
  true
}

###########################################################
# Step 1: Confirm input exists
# Evaluates to true if Terraform provides an input object
input_exists if {
  input
}

###########################################################
# Step 2: Confirm resource_changes exists
# Evaluates to true if resource_changes is present in input
resource_changes_exist if {
  input.resource_changes[_]
}

###########################################################
# Step 3: Minimal AWS resource type check
# Evaluates to true if at least one aws_instance is in the plan
aws_instance_found if {
  input.resource_changes[_].type == "aws_instance"
}

###########################################################
# Step 4: Minimal violation logic
# Evaluates to true if any aws_instance is not t3.*
violation_found if {
  input.resource_changes[_].type == "aws_instance"
  not startswith(input.resource_changes[_].change.after.instance_type, "t3.")
}

###########################################################
# Step 5: Main deny rule for policy set
# Evalu
