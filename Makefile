update-subtrees:
	git subtree pull --prefix vim https://github.com/abraithwaite/dotvim.git master --squash

update-submodules:
	git submodule update --init --recursive
