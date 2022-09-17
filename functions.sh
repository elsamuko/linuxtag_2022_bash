
export NUR_IN_FUNCTIONS="Nur hier"

function hello_from_functions {
    echo "Hello from functions.sh : $1"
}

function to_upper {
    echo ${1^^}
}
