!SLIDE bullets
# Tools #

* deploy
* secrets
* configuration
* environments
* ci

!SLIDE bullets
# More Tools #

* coordination
* packaging
* misc
!SLIDE 
# Deploy #

Deploy anything anywere with confidence.

!SLIDE bullets incremental
# Deploy History #

* inspired by GitHub Spring Cleaning
* started as Capfile
* propagated via cargo cult copy-pasta
* projects forced to fit the mold
* hardcoded host and environments

!SLIDE bullets incremental
# Deploy Progress #

* alpha_omega is a gem, capistrano fork
* used to deploy chef, apps, home
* most apps have alpha_omega branch
* larger apps drive missing features

!SLIDE bullets incremental
# Deploy March 2012 #

* prioritize feature development
* move projects to alpha_omega
* train developers

!SLIDE bullets incremental
# Deploy Future #

* cue - cli how-to
* session - shared logs, screens
* project specific commands
* tie deploys to dashboard
* automatic deploys by ci, bots
!SLIDE 
# Secrets #

Secrets are a PITA to manage correctly

!SLIDE bullets incremental
# Secrets History #

* ssl certs, ssh keys, passwords, gpg
* local version control
* course grained propagation
* mostly manual process

!SLIDE bullets incremental
# Secrets Progress #

* common secrets identified
* pods create two more secrets repos

!SLIDE bullets incremental
# Secrets Future #

* encrypted backups
* private encrypted github
* central secrets
* apps use secrets directly
* better gpg tools

!SLIDE bullets incremental
# Secrets for Devs #

* seeding configuration
* self serve ssh, gpg keys and agents
* per app secrets
!SLIDE 
# Configuration #

Nuking TV Dinners in the Microwave

!SLIDE bullets incremental
# Configuration History #

* monolithic chef repo run as root
* tricky to coordinate config and app
* chef fork is monkey patches
* hard to get started
* no tests

!SLIDE bullets incremental
# Microwave #

* microwave is a gem, chef fork
* tvdinners are gems of cookbooks, etc.
* runs as non-root, part of deploy
* not yet divorced from chef

!SLIDE bullets incremental
# TV Dinners as Software #

* gems, managed with bundler
* documentation (ronn, docco)
* scripts (boson, rake)
* tests (cucumber)

!SLIDE bullets incremental
# Microwave for Devs #

* track config and app in one repo
* minimal ops

!SLIDE bullets incremental
# Configuration Future #

* tv dinner market
* meta dinners
* ci integration
!SLIDE 
# Environments #

Developing with the full production stack

!SLIDE bullets incremental
# Environments History #

* OS X workstations, Ubuntu servers
* zbrew - homebrew fork 

!SLIDE bullets incremental
# Environments Progress #

* macports binary os x distribution
* ubuntu veewee/vagrant virtualbox
* common bootstrap
* common cookbooks

!SLIDE bullets incremental
# Environments Future #

* pancake - matching os x stack as production
* multi-node
* ec2
* powerless - os x dns, firewall tricks
* tunnels, openvpn

!SLIDE bullets incremental
# Environments Hardware #

* Quad-core, 16GB memory, SSD

!SLIDE 
# Continuous Integration #

CI not just for Developers

!SLIDE bullets incremental
# CI History #

* cloud instances
* mainly for applications

!SLIDE bullets incremental
# CI Future #

* automatic deploys, tagging
* first day app, ops deploy
* chef, bootstrap into ci
* convention for per-project builds

!SLIDE bullets incremental
# CI Million Years in the Future #

* deploy via chat
* testing in pod-like environments
* cluster of CI servers in the office
!SLIDE 
# Coordination #

The fog of war

!SLIDE bullets incremental
# Coordination Future #

* opsdb - source of truth
* tracker - change contents
* timeline - change events
* suppression, locking
* mmtop
!SLIDE 
# Advocates #

Help advocates help themselves

!SLIDE bullets incremental
# Advocates Dashboards #

* smokeping with more targets, dist
* ci, icinga dashboards
* bling, livemap, pingdom
* email blacklists
* pagerduty rosters

!SLIDE bullets incremental
# Advocates Tools #

* ultra grep
* by* queries
* ANTLR grammars
* semi-structured logging
* log archival
!SLIDE 
# Packaging #

Custom anything has maintenance overhead

!SLIDE bullets incremental
# Packaging History #

* Ubuntu packages
* rvm, rvm rubies
* custom solr builds
* git forks

!SLIDE bullets incremental
# Packaging Progress #

* private_event - hosting custom gems, packages
* gh, rb helpers
* rvm, rvm rubies

!SLIDE bullets incremental
# Packaging Future #

* Ubuntu packages into git
* forks accepted upsteam
* documentation
* private file server
!SLIDE 
# Misc #

My utility belt

!SLIDE bullets incremental
# badonkadonk ~ #

* junas - vim distribution
* hubflow - merge of git flow and github hub
* cue, session
* macports, vagrant
* powerless

!SLIDE bullets incremental
# dog food is good #

* alpha_omega
* microwave, tv dinners
* rvm
* secrets
* helpers

!SLIDE bullets incremental
# experimental #

* marathon - common service management
* surface - project discovery
* RTFMd - project documentation
* timeline

