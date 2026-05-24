#!/bin/zsh

for dir in ${PWD}/*(/); do
    echo "setup $(basename ${dir})..."
    cd "${dir}"
    if [[ -f "setup.sh" ]]; then
        ./setup.sh
    fi
    cd -
    echo "done"
    echo ""
done
