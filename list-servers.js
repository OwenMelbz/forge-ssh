#!/usr/bin/env node

const manifest = require(`${__dirname}/manifest.json`);

const data = {};

manifest.servers.forEach(server => {
    data[server.name] = server.ip_address;
})

console.table(data);
