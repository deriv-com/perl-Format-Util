test:
	dzil test

tidy:
	find . -name '*.p?.bak' -delete
	find . -not -path "./.git*" -not -path "./srp*" -not -path "./.vscode*" -name '*.p[lm]' -o -name '*.t' | xargs perltidy -pro=/home/git/regentmarkets/cpan/rc/.perltidyrc --backup-and-modify-in-place -bext=tidyup
	find . -name '*.tidyup' -delete

