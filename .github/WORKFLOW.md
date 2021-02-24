## Start Developing

- Clone the module repository.
```
git clone https://github.com/nclouds/<terraform-aws-xxx>.git
```
- The first time you clone a particular repo you will need to install the pre-commit hooks; just run from module folder:
```
pre-commit install
````
- Create a working Branch
```
git checkout -b <feature|bugfix|hotfix|fix/<Issue#>-<Short_Descr>
```

- Make changes to the code.

## Test Your Changes

- There are working examples in the `examples folder`. Please perform the regression tests within the examples folder.
- Most or the modules have a simple working example which creates the resources with default configuration and you pass minimal parameters. In order to test with minimal example, please execute:
```
cd examples/simple

terraform init

terraform plan

terraform apply
```
- There are more complex examples too in repositories. Make sure they are also working fine after your changes. You can test them out in a similar way.

## Commit Your changes

Once you are happy with your changes, you are all set to commit. Below are some instructions which can help you with commits:
- Repository has a changelog automation in place which means that CHANGELOGs for new releases are generated automatically based on text in Commit Messages, PR Messages etc. Do not update the CHANGELOG file. The maintainers of the project will take care of this when they release a new version of the module.
- Make sure your commit messages follow Sematic Prefix as described below.
- Update the README.md with any changes to new variables, ports or other needed information to use the new feature.
- pre-commit hooks are configured which execute locally on your machine on every commit. These hooks are based on this repo and run the following checks:
  - **Terraform Docs**: This hook ensures that the README.md contains the relevant information about the module.
  - **Terraform Format**: This hook ensures that terraform code is formatted properly.
  - **Terraform Lint**: This hook ensures that there are no limiting errors in the code.
  - **Terraform Security Scan**: This hook performs a scan on the code against security best practices.
- Make sure all TESTS are passing before you push your changes.

## Raise a Semantic Pull Request

1. Add semantic prefix to your PR or Commits (at least one of your commit groups)
- `feat:` for new features
- `fix:` for bug fixes
- `docs:` for documentation and examples
- `style:` changes that do not affect the meaning of the code (white-space, formatting, etc.)
2. Add a reviewer to your PR and wait for feedback and one approval before being able to merge your change.
3. Make sure the Github Actions are completed successfully.
4. Once your changes are approved and all checks are successful you should be able to merge in your changes (squashing is recommended). Merged PRs will be included in the next release.
