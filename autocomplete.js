#!/usr/bin/env node

const manifest = require(`${__dirname}/manifest.json`);

const data = manifest.servers.map(server => server.name).join(' ')

console.log(data);
