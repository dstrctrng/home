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
