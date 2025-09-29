policy "instance_type_must_be_t3" {
  enforcement_level = "advisory"
  query             = "data.terraform.deny"
}
