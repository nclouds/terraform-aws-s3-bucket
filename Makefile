RELEASE_TYPE ?= patch
SEMTAG_TOOL:=./tools/semtag
NEXT_TAG:=$(shell $(SEMTAG_TOOL) final -s $(RELEASE_TYPE) -o)
CURRENT_TAG:=$(shell $(SEMTAG_TOOL) getfinal)
UNAME := $(shell uname)
OWNER:=nclouds
REPOSITORY:=$(shell basename `git rev-parse --show-toplevel`)
ifeq ($(UNAME), Darwin)
SED=sed -i ''
else
SED=sed -i
endif

.PHONY: changelog release

changelog:
	echo Generating Changelog for $(RELEASE_TYPE)
	echo "Current Tag => $(CURRENT_TAG)"
	echo "Next Tag => $(NEXT_TAG)"
	git-chglog -o CHANGELOG.md --next-tag $(NEXT_TAG)
	$(SED) "s/$(CURRENT_TAG)/$(NEXT_TAG)/g" README.md
	git config --local user.name github-actions
	git config --local user.email "github-actions@github.com" 
	git commit -am "Lock Version $(NEXT_TAG)"
	git push

release:
	$(SEMTAG_TOOL) final -s $(RELEASE_TYPE)
	curl -X POST -H "Accept: application/vnd.github+json" -H "Authorization: token $(GH_TOKEN)" https://api.github.com/repos/$(OWNER)/$(REPOSITORY)/releases -d '{"tag_name": "$(NEXT_TAG)","name": "$(NEXT_TAG)"}'
