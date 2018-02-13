# Drupal Docker
This project contains three docker containers (nginx, php, mysql) that can be used to create a super simple local environment for development of LAMP websites.

While this project is intended for Drupal, it can also be used for WordPress, Joomla!, or any other php-based website.

## Installation instructions
1. Install [Docker for Mac](https://docs.docker.com/docker-for-mac/install/)
1. Navigate to where to want to put your websites
   * cd /www/sites
1. Make a folder for your website
   * mkdir /www/sites/awesomesite_ext
1. Clone the repository into that website folder.
   * git clone git@github.com:DesignGoggles/drupal-docker.git /www/sites/awesomesite_ext
1. Rename the three container_name values in docker-compose.yml
   * e.g. container_name: nginx_acronym
     * Nginx Container.
   * e.g. container_name: acronym
     * PHP Container. This should be short as you will use it to connect to the container.
   * e.g. container_name: mysql_acronym
     * MySQL Container. You will use this name as the 'hostname' for mysql connections.
1. Make an 'html' folder to hold the website files
   * mkdir /www/sites/awesomesite_ext/html
1. Build the docker images (This can take a long time, so do other steps in the meantime)
   * docker-compose build
1. Put your website files in /www/sites/awesomesite_ext/html
1. Update the settings.php file with the mysql hostname created in the earlier step.
1. Add three aliases to ~/.bashrc OR ~/.bash_profile
   * alias dstart='docker-compose up -d'
   * alias dstop='docker stop $(docker ps -aq)'
   * alias dssh='docker exec -it php bash'
1. Source the file above
   * source ~/.bashrc OR source ~/.bash_profile
1. Once the images are built navigate to the website folder
   * cd /www/sites/awesomesite_ext
1. Run dstart. Three containers should start: php, nginx, mysql.
   * You can then verify they are running by executing *docker ps*
1. View the website at http://localhost:8080

#### In order to run drush, composer, and git commands you need to connect to the php container.
1. Navigate to the website folder
   * cd /www/sites/awesomesite_ext
1. Connect to the php container
   * Type dssh and hit return *Note: The php container must be running in order for you to connect to it.*
   
You will then see a prompt that resembles **root@96a208926e83:/var/www/html#** and be able to run drush commands.

### Notes
* You can only run the containers for one site at a time.
* You will need to clone this repository into each website folder.
* In order to switch from one site to another, stop the currently running containers, switch to the other folder, start those containers.

### Commands
* **dstart** Starts the containers
* **dstop** Stops the containers
* **dssh** Connects to the running php container
* **exit** (From within a container) Exits the container
* **docker-compose build** Builds the container images
* **docker ps -a** Shows all docker containers (remove the -a to only show running containers)


#### TODO:
+ Create a Drupal 8 universal settings.php
+ Add documentation for how to update drush for D8 websites
