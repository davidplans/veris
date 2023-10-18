var admin = require("firebase-admin");
const fs = require('fs');
const axios = require('axios');
const ld = require('lodash');

const args = process.argv.slice(2); // The first two elements are node and the script file

// Log the arguments
const studyId = args[0].split('id=')[1];

const serviceAccount = require("./digit-veris-firebase-adminsdk.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

const db = admin.firestore();

// can be filtered by user IDs
const users = [];

const query = db.collectionGroup('studies')
  .where('studyId', '==', studyId)
// .where('userId', 'in', users);

query.get()
  .then(async (querySnapshot) => {
    const data = [];
    querySnapshot.forEach((doc) => {
      data.push(doc.data());
    });
    const formatted = await formatData(data);
    const dateTime = getFormattedDataTime();
    const path = `./results/output-${dateTime}.json`;
    fs.writeFileSync(path, JSON.stringify(formatted));
    console.log(`Data saved to -> ${path}`);
  })
  .catch((error) => {
    console.log('Error getting documents: ', error);
  });

async function formatData(data) {
  if (studyId === 'TEQNECK') {
    const protocolData = await fetchJSONData('https://firebasestorage.googleapis.com/v0/b/digit-veris.appspot.com/o/veris_digit_test.json?alt=media&token=d8b7c9b9-0038-47a1-8a5a-474a46027574')
    return ld.map(data, (item) => {
      const moduleInProtocolByName = ld.find(protocolData.modules, {'name': item.moduleName});
      if (!moduleInProtocolByName) {
        return item;
      }

      const sectionInProtocol = ld.find(moduleInProtocolByName.sections, {'name': item.sectionName});
      if (!sectionInProtocol) {
        return item;
      }
      item.values = ld.map(item.values, (element) => {
        element.questionId = sectionInProtocol.questions[element.questionId].id;
        return element;
      });
      item.moduleId = moduleInProtocolByName.uuid;
      return item;
    });
  }
  return data;
}

async function fetchJSONData(url) {
  try {
    const response = await axios.get(url);
    const jsonData = response.data;
    return jsonData;
  } catch (error) {
    console.error('Error fetching JSON:', error);
  }
}

function getFormattedDataTime() {
  const now = new Date();

  const year = now.getFullYear();
  const month = String(now.getMonth() + 1).padStart(2, '0');
  const day = String(now.getDate()).padStart(2, '0');
  const hour = String(now.getHours()).padStart(2, '0');
  const minute = String(now.getMinutes()).padStart(2, '0');
  const second = String(now.getSeconds()).padStart(2, '0');
  
  // Format the date and time
  const formattedDate = `${year}-${month}-${day}-${hour}-${minute}-${second}`;
  return formattedDate;
}


