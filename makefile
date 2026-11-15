
.PHONY: all clean FORCE

all: README.md

README.md: FORCE
	@printf '# The Guessing Game\n\n' > README.md
	@printf 'A Bash program that asks you to guess how many files are in the current directory.\n\n' >> README.md
	@printf '## Project information\n\n' >> README.md
	@printf -- '- Date and time generated: %s\n' "$$(date)" >> README.md
	@printf -- '- Lines in guessinggame.sh: %s\n\n' "$$(wc -l < guessinggame.sh | tr -d ' ')" >> README.md
	@printf '## How to run\n\n```bash\nbash guessinggame.sh\n```\n' >> README.md

clean:
	rm -f README.md

FORCE: