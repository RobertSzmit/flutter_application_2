const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.sendNotificationOnNewNews = functions.firestore
    .document('news/{newsId}')
    .onCreate(async (snap, context) => {
        const newsData = snap.data();

        const message = {
            notification: {
                title: 'Nowa wiadomość',
                body: newsData.title || 'Nowy news dostępny!'
            },
            topic: 'news'
        };

        try {
            const response = await admin.messaging().send(message);
            console.log('Successfully sent message:', response);
            return null;
        } catch (error) {
            console.error('Error sending message:', error);
            return null;
        }
    });