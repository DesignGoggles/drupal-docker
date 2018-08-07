alias dstart='docker-compose up -d'
alias dstop='docker stop $(docker ps -aq)'
alias dbuild='docker-compose build'

function ds() {
  docker exec -it $1 bash;
}
