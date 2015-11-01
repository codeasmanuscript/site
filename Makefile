##-------------------------------------------------------------------
# Variables
site_repo=`basename "$$PWD"`

## List of commands to use for Makefile.
all :
	@grep -E '^##' Makefile | sed -e 's/##//g'
##-------------------------------------------------------------------
## test_local  : Test the site locally before building live version
test_local :
	jekyll serve --watch

## update_site : Build the GitHub pages site
update_site :
	rsync -a --exclude='.git/' --exclude='.gitignore' ../workshops/ ../${site_repo}/
	./knitpost.R

## clean_dir   : Clean up left over files from updated website
clean_dir :
	git clean -d -x -f

.PHONY : update_site test_local clean_dir

