# Releasing a new version of the module

- This step is done by an administrator when it’s time to release a new version of the module. A new version of a module may contain one or more merged PRs.
- Changelog creation is automated and if you have followed Semantic PR correctly, the following command will generate the ChangeLog (CHANGELOG.md) automatically.
- The following command generates the changelog:
```
make changelog
```
this by default uses the `minor` version increase for the new version. Is something else is required the git-chglog can be run manually like so (for ex. for patch level):
```
git-chglog -o CHANGELOG.md --next-tag `semtag final -s patch -o`
```
- after changing in the `README.md` the references to the old version to the new one, we would commit these into the repo and push them to github.
- Finally the following command creates the new release (creates and pushes a new tag for the module):
```
make release
```

TODO: document install of `semtag` and `git-chglog` that are needed for admins to release new versions.
