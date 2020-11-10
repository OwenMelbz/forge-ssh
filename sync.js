#!/usr/bin/env node

const https = require('https');
const fs = require('fs');

const API_KEY = fs.readFileSync(`${__dirname}/forge.key`, 'UTF-8').trim();

console.log('Connecting...');

const request = https.request({
    hostname: 'forge.laravel.com',
    port: 443,
    path: '/api/v1/servers',
    method: 'GET',
    headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + API_KEY,
    }
}, response => {
    console.log('Connected...');

    response.setEncoding('utf8');

    let body = '';

    response.on('data', chunk => {
        console.log('Data received...')
        body += chunk;
    });

    response.on('end', () => {
        console.log('Data saving...')
        fs.writeFileSync(`${__dirname}/manifest.json`, body);
        console.log(`Data saved to ${__dirname}/manifest.json ...`)
        process.exit();
    })
}).on('error', error => {
    console.error(`Error: ${error}`);
})

request.write("data\n");
request.end();

console.log('Disconnected...');
