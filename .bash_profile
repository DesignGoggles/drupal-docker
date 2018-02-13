alias dstart='docker-compose up -d'
alias dstop='docker stop $(docker ps -aq)'

function ds() {
  docker exec -it $1 bash;
}
