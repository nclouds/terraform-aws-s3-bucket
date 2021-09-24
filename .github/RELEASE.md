# Releasing a new version of the module

After a developer's code is merged into `master` branch, it's time to crate a change-log and release a new version of the module. This is done by the automation using Makefile which has two phony targets to create a changelog and make a release.

```bash
.PHONY: changelog release
changelog:
  git-chglog -o CHANGELOG.md --next-tag `semtag final -s minor -o`

release:
  semtag final -s minor
```

ChangeLog template is stored within `.chglog` directory.

Please note the following when you want to make a new release:

- This step is done by an `administrator` of the module . A new version of a module may contain one or more merged PRs.
- Changelog creation is automated and if you have followed Semantic PR correctly, the ChangeLog (`CHANGELOG.md`) automatically.
- By Default, the automation bumps a `minor` version. If you want to bump a `patch` or `major` version, you need to follow the steps in the end of this section

- Follow the below instructions to generate the change log:
    - `Minor` Version Upgrade ⇒ e.g  **x.1.y ⇒ x.2.0** **(Default Behaviour)**
        1. The following command generates the changelog and update `CHANGELOG.md`:

            ```bash
            make changelog
            ```

        2. Change any references to the new version in the following files:
            1. Main `README.md` of the module.
            2. Any `README.md` files in the examples directory.
        3. Commit the changes with the following message

            ```bash
            git commit -am "Lock Version <Version Number>"
            ```

        4. Make a Release now. This will creates and pushes a new tag for the module

            ```bash
            make release
            ```

        5. Go to Remote Repository URL now and publish the Release to make it `Latest Release`

            For Example, to publish a new release for Security Group Module, perform the following:

            1. Go to the URL : [https://github.com/nclouds/terraform-aws-security-group/releases](https://github.com/nclouds/terraform-aws-security-group/releases)
            2. Click on `Draft a New Release` 
            3. Enter the details:
                1. Choose the latest tag you created above.
                2. Give your release a `Title`
                3. Write `description` about the Release
            4. Click on `Publish Release`
    - `Major` Version Upgrade ⇒ e.g  **1.x.y ⇒ 2.0.0**
        1. Clone the module on your local machine and switch to `master` branch.

            You can do so by replacing just the `<module_name>` with your module's repo name

            ```bash
            	MODULE_NAME="<module_name>"
            	BRANCH_NAME="master"
            	git clone git@github.com:nclouds/$MODULE_NAME.git
            	cd $MODULE_NAME && git checkout master
            	git pull 
            ```

        2. Update(`CHANGELOG.md`)  by running the following command.

            ```bash
            git-chglog -o CHANGELOG.md --next-tag `semtag final -s major -o`
            ```

        3. Change any references to the new version in the following files:
            1. Main `README.md` of the module.
            2. Any `README.md` files in the examples directory.
        4. Commit the changes with the following message

            ```bash
            git commit -am "Lock Version <Version Number>"
            ```

        5. Make a Release now. This will creates and pushes a new tag for the module

            ```bash
            semtag final -s major
            ```

        6. Go to Remote Repository URL now and publish the Release to make it `Latest Release`

            For Example, to publish a new release for Security Group Module, perform the following:

            1. Go to the URL : [https://github.com/nclouds/terraform-aws-security-group/releases](https://github.com/nclouds/terraform-aws-security-group/releases)
            2. Click on `Draft a New Release` 
            3. Enter the details:
                1. Choose the latest tag you created above.
                2. Give your release a `Title`
                3. Write `description` about the Release
            4. Click on `Publish Release`

    - `Patch` Version Upgrade ⇒ e.g  **x.y.1 ⇒ x.y.2**
        1. Clone the module on your local machine and switch to `master` branch.

            You can do so by replacing just the `<module_name>` with your module's repo name

            ```bash
            	MODULE_NAME="<module_name>"
            	BRANCH_NAME="master"
            	git clone git@github.com:nclouds/$MODULE_NAME.git
            	cd $MODULE_NAME && git checkout master
            	git pull 
            ```

        2. Update(`CHANGELOG.md`)  by running the following command.

            ```bash
            git-chglog -o CHANGELOG.md --next-tag `semtag final -s patch -o`
            ```

        3. Change any references to the new version in the following files:
            1. Main `README.md` of the module.
            2. Any `README.md` files in the examples directory.
        4. Commit the changes with the following message

            ```bash
            git commit -am "Lock Version <Version Number>"
            ```

        5. Make a Release now. This will creates and pushes a new tag for the module

            ```bash
            semtag final -s patch
            ```

        6. Go to Remote Repository URL now and publish the Release to make it `Latest Release`

            For Example, to publish a new release for Security Group Module, perform the following:

            1. Go to the URL : [https://github.com/nclouds/terraform-aws-security-group/releases](https://github.com/nclouds/terraform-aws-security-group/releases)
            2. Click on `Draft a New Release` 
            3. Enter the details:
                1. Choose the latest tag you created above.
                2. Give your release a `Title`
                3. Write `description` about the Release
            4. Click on `Publish Release`

TODO: document install of `semtag` and `git-chglog` that are needed for admins to release new versions.
