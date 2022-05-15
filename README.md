## Description
This project is an introduction to cloud servers


> This topic is inspired by the subject Inception. The goal is to deploy your site and the
necessary docker infrastructure on an instance provided by a cloud provider.
In this version, each process will have its container. You CANNOT deploy the same
images from Inception and be done with it ;) You can of course get the source of the
website (Your WordPress blog for instance), but you have to deploy it using a container
per process and automation.
Automation is essential here. The stages of deployment must be automated by a tool
of your choice (We suggest Ansible).
This complete web server must be able to run several services in parallels such as
Wordpress, PHPmyadmin and a database.
