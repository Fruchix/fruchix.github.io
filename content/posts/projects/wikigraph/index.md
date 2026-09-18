---
title: "WikiGraph"
date: 2026-09-15
draft: false
tags: ["TypeScript", "React", "Socket.IO"]
categories: ["Projects"]
menu:
  sidebar:
    name: WikiGraph
    identifier: wikigraph
    parent: projects
    weight: 30
---

Web-based real-time multiplayer game, where players navigate through Wikipedia pages by clicking on internal links in order to reach one or more target pages.

WikiGraph is currently hosted at <a href="https://wikigraph.fr" target="_blank">wikigraph.fr</a>


## Background

WikiGraph actually started as a 2025 academic assignment: build a standard full-stack web app from scratch, with role-based auth, REST endpoints, and a CI/CD pipeline. We had the possibility to do anything, from personal websites, social networks, company flagship websites, and more. I liked the idea of making a game out of this assignment.

I worked in pair with a friend, Rémy Guyon.

It has then evolved into a personal project that I continued to develop and maintain after the end of the academic project.

## Current state of the project

Needing to balance work life, personal life and my personal computer science passion, the game is a bit at a stale point. The codebase should be considered as a **prototype only**, especially the frontend and the testing parts. See the <a href="#development-status">Development status</a> below.


## Architecture

The code is currently not open source, though I will make it so *for sure*, as open source is very important to me.

- Frontend
  - Vite.js
  - React
  - [vis.js](https://visjs.org/): graph modelization
  - [i18next](https://www.i18next.com/): internationalization (not currently enabled, will be used after refactor)
- Backend
  - Node.js
  - [Express](https://expressjs.com/)
    - REST API
    - JWT
    - Serves the frontend after build
  - [Socket.IO](https://socket.io/): websocket management
    - Rooms, events broadcast
  - [Sequelize](https://sequelize.org/)
    - Handle all game information serialization
- Tests
  - backend
    - [Jest](https://jestjs.io/)
    - [Supertest](https://github.com/forwardemail/supertest)
    - [ESLint](https://eslint.org/)
  - frontend
    - [ESLint](https://eslint.org/)

Both frontend and backend use JavaScript and TypeScript.

## Development status

I want to evolve this prototype to a production state, to which I can easily add new features, without having to refactor each time. 

My Trello backlog has around 50 cards of things to implement/refactor......

Here are the main changes to be made:

- [ ] refactor the frontend (in progress)
  - [ ] create reusable react components (in progress)
  - [ ] defensive programming to ensure smooth and coherent navigation (in progress)
  - [ ] improve the design (theme, logos, ...) (in progress)
  - [ ] provide internationalization for at least french and english (in progress)
- [ ] refactor the backend
  - [ ] remove usage of a database, keep games only in-memory (still to be determined weither or not I go with that)
  - [ ] reimplement everything in TypeScript and OOP
  - [ ] implement an event bus (improves the architecture separation, lets the server send events by itself)
- [ ] implement new features
  - [ ] ...


<!-- # Vue d'ensemble
WikiGraph est un projet personnel de jeu en temps réel basé sur Wikipédia...

## Architecture
Ici, tu peux détailler ton backend (Express, SQLite) et ton frontend.
Tu peux même intégrer des schémas de ton infrastructure, des extraits de code, ou une vidéo démo. -->

<!-- ## Updates -->
<!-- * **Septembre 2026 :** Optimisation des requêtes de graphes.
* **Août 2026 :** Déploiement initial de la version bêta. -->   