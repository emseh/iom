/* This JavaScript code sets up a basic WhatsApp service using the `whatsapp-web.js` library along with
Express for handling HTTP requests. Here's a breakdown of what the code does: */
const { Client, LocalAuth } = require('whatsapp-web.js');
const qrcode = require('qrcode-terminal');
const express = require('express');
const app = express();
const port = 3030;

// Initialize the WhatsApp client
const client = new Client({
    authStrategy: new LocalAuth()
});

// Middleware to parse JSON requests
app.use(express.json());

// Generate QR code for authentication
client.on('qr', (qr) => {
    qrcode.generate(qr, { small: true });
});

// Log when client is ready
client.on('ready', () => {
    console.log('Client is ready!');
});

// Handle incoming messages
// client.on('message_create', async message => {
//     console.log('Received message:', message.body);
    
//     // Reply to specific message commands
//     if (message.body === '!ping') {
//         try {
//             // Reply back "pong" directly to the message
//             await message.reply('pong');
//         } catch (error) {
//             console.error('Error replying to message:', error);
//         }
//     }
// });

client.initialize();

app.post('/send-message', (req, res) => {
    const { to, message } = req.body;

    if (!to || !message) {
        return res.status(400).json({ error: 'Missing "to" or "message" field' });
    }

    client.sendMessage(to, message)
        .then(response => res.status(200).json({ message: 'Message sent' }))
        .catch(err => res.status(500).json({ error: 'Error sending message', details: err.toString() }));
});


// Start the server
app.listen(port, () => {
    console.log(`WhatsApp service running on http://localhost:${port}`);
});
