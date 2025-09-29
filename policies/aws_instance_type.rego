package terraform

###########################################################
# Step 0: Confirm parsing works
parse_check if {
  true
}

###########################################################
# Step 1: Confirm input exists
input_exists if {
  input
}

###########################################################
# Step 2: Confirm resource_changes exists
resource_changes_exist if {
  some i
  input.resource_changes[i]
}

###########################################################
# Step 3: Minimal AWS resource type check
aws_instance_found if {
  some i
  input.resource_changes[i].type == "aws_instance"
}

###########################################################
# Step 4: Minimal violation logic
# Checks for aws_instance not using t3.*
violation_found if {
  some i
  input.resource_changes[i].type == "aws_instance"
  not startswith(input.resource_changes[i].change.after.instance_type, "t3.")
}

###########################################################
# Step 5: Main deny rule for policy se
