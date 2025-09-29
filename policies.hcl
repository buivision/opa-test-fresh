policy "parse_check" {
  enforcement_level = "advisory"
  query             = "data.terraform.parse_check"
}

policy "input_exists" {
  enforcement_level = "advisory"
  query             = "data.terraform.input_exists"
}

policy "resource_changes_exist" {
  enforcement_level = "advisory"
  query             = "data.terraform.resource_changes_exist"
}

policy "aws_instance_found" {
  enforcement_level = "advisory"
  query             = "data.terraform.aws_instance_found"
}

policy "violation_found" {
  enforcement_level = "advisory"
  query             = "data.terraform.violation_found"
}

# Real enforcement policy
policy "instance_type_must_be_t3" {
  enforcement_level = "advisory"
  query             = "data.terraform.deny"
}
