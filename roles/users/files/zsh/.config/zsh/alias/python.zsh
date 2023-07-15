#python alias
alias activateVenv='source ./venv/bin/activate'
alias pr='poetry run'
alias prn='poetry shell'
alias pipu='pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U'
