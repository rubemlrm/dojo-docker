# Docker Functions
function  clear_containers() {
	docker stop $(docker ps -a -q)
	docker rm $(docker ps -a -q)
}

function  clear_images() {
	docker rmi -f $(docker images -a -q)
}

function nuke_docker() {
	clear_containers
	clear_images
}

function docker_debug() {
   docker run -it --rm utkuozdemir/swiss-army-knife:v0.4.0 sh
}
