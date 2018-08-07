# Drupal Docker
This project contains three docker containers (nginx, php, mysql) that can be used to create a super simple local environment for development of LAMP websites.

While this project is intended for Drupal, it can also be used for WordPress, Joomla!, or any other php-based website.

## Installation instructions
1. Install [Docker for Mac](https://docs.docker.com/docker-for-mac/install/)
1. Copy the contents of `.bash_profile` into `~/.bashrc` OR `~/.bash_profile`
1. Source the file above
   * `source ~/.bashrc` OR `source ~/.bash_profile`
1. Navigate to where to want to put your websites
   * `cd /www/sites`
1. Make a folder for your website
   * `mkdir /www/sites/awesomesite_ext`
1. Go into the newly created website folder
   * `cd /www/sites/awesomesite_exit`
1. Clone this git repository into that website folder.
   * `git clone https://github.com/DesignGoggles/drupal-docker.git`
1. Make an 'html' folder to hold the website files
   * `mkdir html`
1. Configure website variables
   * Open .env and change `HOSTNAME=hostname` to `HOSTNAME=website_acronym_here`
   * Keep the website_acronym_here short and memorable as you may be typing it frequently.
1. Build the docker images and start the containers
   * Open terminal
   * `cd /www/sites/awesomesite_ext`
   * Run `dbuild`
   * Run `dstart`
   * Run `docker ps` to confirm three containers are running
1. Put your website files in /www/sites/awesomesite_ext/html
1. Update Drupal's settings.php with the following settings:
   * `'host' => 'mysql_website_acronym_here',`
   * `'database' => 'project',`
   * `'username' => 'project',`
   * `'password' => 'project',`
   * `'port' => '3306',`
   * `'driver' => 'mysql',`
1. View the website at http://localhost:8080

#### In order to run drush, composer, and git commands you need to connect to the php container.
1. Connect to the php container
   * Run `ds website_acronym_here` *The php container must be running in order for you to connect to it.*
   * You will then see a prompt that resembles **root@96a208926e83:/var/www/html#** and be able to run drush commands.

### Notes
* You can only run the containers for one website at a time because they all share the same url http://localhost:8080
* You will need to follow this process for every website folder.
* In order to switch from one site to another:
  1. Run `dstop` to stop the currently running containers
  1. Switch to the folder containing the other website cd /www/sites/awesomesite2_ext
  1. Run `dstart`

### Rebuilding/Updating images
* If you want to make a modification to the nginx, php, or mysql (i.e. change the PHP version, the timezone, add php extensions, update packages)  you will need to rebuild the images.
1. Run `dstop` to stop all running containers
1. Make changes to the Docker configuration (You likely will only ever need to modify `/www/sites/awesomesite_extdocker/php/Dockerfile`)
1. Navigate to `/www/sites/awesomesite_ext`, run `dbuild` to rebuild the images, run `dstart` to start the containers.

### D8 Notes
Open `docker/nginx/default.conf` and change `root /var/www/html;` to `root /var/www/html/web`;
* You will then need to rebuild the images using the instructions above.

### Command Summary
* `dstart` Starts the containers
* `dstop` Stops the containers
* `dbuild` Builds the container images
* `ds \<acronym\>` Connects to the running php container
* `exit` (From within a container) Exits the container
* `docker ps -a` Shows all docker containers (remove the -a to only show running containers)


#### TODO:
+ Create a Drupal 8 universal settings.php
+ Add documentation for how to update drush for D8 websites