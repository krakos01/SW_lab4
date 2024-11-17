const fs = require('fs');  // FileSync
const os = require('os');  // OS

console.log(os.networkInterfaces());

const version = process.env.APP_VER;

// Zawartość index.html
const content = `
  <html>
    <head><title>Server Info</title></head>
    <body>
      <p>IP: ${os.networkInterfaces()['eth0'][0]['address']}</p>
      <p>Hostname: ${os.hostname()}</p>
      <p>Wersja: ${version}</p>
    </body>
  </html>
`;


// Zapisanie contentu do pliku index.html nginxa
fs.writeFileSync('/usr/app/index.html', content, 'utf8');