# Contributing

When contributing to this repository, please first create a new issue.

## Pull Request Process

1. Add [semantic prefix](#semantic-pull-requests) to your PR or Commits (at least one of your commit groups)
2. Update the README.md with any changes to new variables, ports or other needed information to use the new feature.
3. Do not update the CHANGELOG file. The maintainers of the project will take care of this when they release a new version of the module.

## Semantic Pull Requests

To generate the changelog, Pull Requests or Commits must have semantic and must follow conventional specs below:

- `feat:` for new features
- `fix:` for bug fixes
- `docs:` for documentation and examples
- `style:` changes that do not affect the meaning of the code (white-space, formatting, etc.)

## Terraform specifics

* Modules must include the following `tags` variable:
```
variable "tags" {
    description = "Tags to be applied to the resource"
    default     = {}
    type        = map
}
```
And all resources that support it must be tagged with it like so:
```
resource "aws_security_group" "default" {
    description = var.description
    vpc_id      = var.vpc_id
    name        = "${var.identifier}-${terraform.workspace}"

    tags        = var.tags <------- always at the bottom
}
```

* If a resource includes a count directive it must be at the top of that resource’s attributes followed by a blank line:
```
resource "aws_security_group_rule" "default_ingress_rules" {
  count             = length(var.ingress_rule_list) <---- always at the top

  security_group_id = aws_security_group.default.id
  ...
```
* Variable names must be in lowercase [snake_case](https://en.wikipedia.org/wiki/Snake_case)
* Resource names must be in lowercase [kebab-case](https://en.wiktionary.org/wiki/kebab_case)
* Resource names must include the terraform workspace at the end:
```
resource "aws_security_group" "default" {
    description = var.description
    vpc_id      = var.vpc_id
    name        = "${var.identifier}-${terraform.workspace}"
```
* All resources must include the default tags `Name=${var.identifier}-${terraform.workspace}` and `Environment=${terraform.workspace}`
The Name and Environment tags get merged with the “tags” parameter.
* All modules should generate a single output called `output` as an object that includes every relevant resource that was created as part of the module. For example:
```
output "output" {
    value = {
      log_group = aws_cloudwatch_log_group.function_logs
      function  = aws_lambda_function.function
    }
}
```
