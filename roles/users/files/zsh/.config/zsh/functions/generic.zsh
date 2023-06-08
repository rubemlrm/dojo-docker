
function toBase64() {
    echo "$1" | base64
}

function fromBase64() {
    echo "$1" | base64 -d
}
# archive compress
function  compress() {
    if [[ -n "$1" ]]; then
        local file=$1
        shift
        case "$file" in
            *.tar ) tar cf "$file" "$*" ;;
            *.tar.bz2 ) tar cjf "$file" "$*" ;;
            *.tar.gz ) tar czf "$file" "$*" ;;
            *.tgz ) tar czf "$file" "$*" ;;
            *.zip ) zip "$file" "$*" ;;
            *.rar ) rar "$file" "$*" ;;
            * ) tar zcvf "$file.tar.gz" "$*" ;;
        esac
    else
        echo 'usage: compress <foo.tar.gz> ./foo ./bar'
    fi
}

# archive extract
function  extract() {
    if [[ -f "$1" ]] ; then
        local filename=$(basename "$1")
        local foldername=${filename%%.*}
        local fullpath=$(perl -e 'use Cwd "abs_path";print abs_path(shift)' "$1")
        local didfolderexist=false
        if [[ -d "$foldername" ]]; then
            didfolderexist=true
            read -p "$foldername already exists, do you want to overwrite it? (y/n) " -n 1
            echo
            if [[ "$REPLY" =~ ^[Nn]$ ]]; then
                return
            fi
        fi
        mkdir -p "$foldername" && cd "$foldername"
        case "$1" in
            *.tar.bz2) tar xjf "$fullpath" ;;
            *.tar.gz) tar xzf "$fullpath" ;;
            *.tar.xz) tar Jxvf "$fullpath" ;;
            *.tar.Z) tar xzf "$fullpath" ;;
            *.tar) tar xf "$fullpath" ;;
            *.taz) tar xzf "$fullpath" ;;
            *.tb2) tar xjf "$fullpath" ;;
            *.tbz) tar xjf "$fullpath" ;;
            *.tbz2) tar xjf "$fullpath" ;;
            *.tgz) tar xzf "$fullpath" ;;
            *.txz) tar Jxvf "$fullpath" ;;
            *.zip) unzip "$fullpath" ;;
            *) echo "'$1' cannot be extracted via extract()" \
                && cd .. \
                && ! "$didfolderexist" \
                && rm -r "$foldername" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

