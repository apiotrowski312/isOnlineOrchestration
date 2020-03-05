# isOnlineOrchestration

This app was built just for learning purposes. 

I utilized three topics I wanted to learn:

- microservices architecture
- mvc
- golang

This app allows you to create user, authenticate and authorize user, add site to ping and retrive data from ping site scheduler.

## Repositories

This is main repository of the project.

All available commands can be found under command `make help` or simply `make`

## Help

| Command  | Description                                                     |
| -------- | --------------------------------------------------------------- |
| git-init | Download all repositories                                       |
| unit     | Run unit tests from choosen directory (Use flag: PROJ=utils-go) |
| unittest | Run all unit tests                                              |
| up       | Start everything                                                |
| up-db    | Start databases                                                 |
| up-svc   | Start services                                                  |
| logs     | Show all docker-compose logs                                    |
| stop     | Stops all containers                                            |
| stop-svc | Stops all services containers                                   |
| down     | Destroy **ALL** docker containers, volumes, network etc.        |
| help     | Show this help                                                  |

## Setup

To download all repositories you will need call command `make git-init`

To run all services you can use provided docker-compose file or simply run `make up-db` and then `make up-svc`. 

---

:exclamation: **Important note** :exclamation:

Right now there is an issiue with running dbs and svc at the same time, I will fix it in future if I come back to this project

---
