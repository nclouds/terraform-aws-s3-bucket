# Setup your local machine

You need to have the following tools installed in order to work with this repository:
- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- [tfenv](https://github.com/tfutils/tfenv) - this is not really required, but it is very useful when working with various versions of terraform at the same time.
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- [Pre-commit](https://pre-commit.com/)
- [terraform_docs](https://github.com/terraform-docs/terraform-docs)
- [tflint](https://github.com/terraform-linters/tflint)
- [tfsec](https://github.com/tfsec/tfsec)

## Example Installation on MacOS:

Below are the installation examples to setup your macbook with everything that you need to contribute to these repositories. For any other Operating System, please follow the respective installation documentations above.

The easies way to get all these tools on your MacBook is to install Homebrew.

```
# Install Homebrew if you don't have it already
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Terraform version manager
brew install tfenv

# Install latest terraform using tfenv
tfenv install
# You can also install a specific version like an old 0.11 on:
tfenv install 0.11.14
# use tfenv use to select the active version of terrafom

# Verify Installation
terraform -help
terraform --version

# Install Git
brew install git

# Install pre-commit
brew install pre-commit

# Install Terraform Docs
brew install terraform-docs

# Install Terraform lint
brew install tflint

# Install tfsec
brew install tfsec
```
