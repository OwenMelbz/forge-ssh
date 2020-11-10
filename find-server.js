#!/usr/bin/env node
const fs = require('fs');

let servers = [];

const tryDownload = () => {
    // console.error('Trying to download manifest...')
    require(`${__dirname}/sync.js`);
}

const startLookup = () => {
    const args = process.argv.slice(2);
    const serverName = args[args.length -1];

    const server = servers.find(s => s.name === serverName);

    if (server) {
        console.log(server.ip_address)
        process.exit(0)
    }

    process.exit(1);
}

if (fs.existsSync(`${__dirname}/manifest.json`)) {
    try {
        const manifest = require(`${__dirname}/manifest.json`);

        if (!manifest || !manifest.servers) {
            // console.log('Cannot find servers within manifest.json... downloading...')
            tryDownload();
        }
        else {
            servers = manifest.servers;
            startLookup();
        }
    } catch (error) {
        // console.log('Cannot parse manifest.json... downloading...')
        tryDownload();
    }
} else {
    // console.log('Manifest does not exist... downloading...')
    tryDownload();
}
