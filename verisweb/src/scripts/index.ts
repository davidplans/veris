import { initializeApp } from "@firebase/app";
import { getFirestore, getDocs, query, collectionGroup, where } from "@firebase/firestore";
import * as ld from 'lodash';

// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

console.log('test');

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
    apiKey: "AIzaSyCf_0n4ehVdWJwQ4qPT4Abu-dzB_cFipCQ",
    authDomain: "patdeployments.firebaseapp.com",
    databaseURL: "https://patdeployments-default-rtdb.europe-west1.firebasedatabase.app",
    projectId: "patdeployments",
    storageBucket: "patdeployments.appspot.com",
    messagingSenderId: "347571404214",
    appId: "1:347571404214:web:b14c10f03f7e63accb1517",
    measurementId: "G-4C07Z35G64"
};

const app = initializeApp(firebaseConfig);
const db = getFirestore(app);

(async function () {
    // Initialize Firebase

    const modulesRef = await query(collectionGroup(db, "studies"));
    const docsModulesSnap = await getDocs(modulesRef);
    console.log("🚀 ~ file: index.ts:28 ~ docsModulesSnap", docsModulesSnap)


    var studyIdArray = [];
    var table = document.getElementById('myTable');
    docsModulesSnap.forEach(doc => {

        var id = doc.data().studyId;
        console.log("🚀 ~ file: index.ts:36 ~ id", id)
        // console.log(doc.data());
        if (!studyIdArray.includes(id)) {
            studyIdArray.push(id);
            let tr = document.createElement('tr');
            let td_id = document.createElement('td');
            let td_btn = document.createElement('td');
            let btn = document.createElement('button');
            td_id.textContent = id;
            td_btn.setAttribute('id', id);
            btn.textContent = "Download";
            td_btn.addEventListener("click", function () {
                return getStudies(id);
            });
            td_btn.appendChild(btn);
            tr.appendChild(td_id);
            tr.appendChild(td_btn);

            table.appendChild(tr);
        }
    });
    try {

    } catch (error) {
        console.log(error);
    }
})();






async function getStudies(idStudy) {

    try {
        // console.log(idStudy);
        const queryModules = await query(collectionGroup(db, "studies"), where("studyId", "==", idStudy));
        const moduleSnapshot = await getDocs(queryModules);
        console.log("🚀 ~ file: index.ts:78 ~ getStudies ~ moduleSnapshot", moduleSnapshot)

        // return;
        const basedData: any[] = [];
        moduleSnapshot.forEach((study) => { 
            const studyItem = study.data();
            const moduleType = studyItem.moduleName ? 'survey' : 'pat'; // TODO change it
            let values = null;

            if (moduleType === 'survey') {
                values = ld.map(studyItem.values, (item) => {
                    return {
                        questionId: item.questionId,
                        value: item.value
                    }
                })
            }

            if (moduleType === 'pat') {
                const item = ld.cloneDeep(studyItem);
                delete item.userId;
                delete item.studyId;
                delete item.moduleType;
                values = item;
            }

            basedData.push(
                {
                    userId: studyItem.userId,
                    studyId: studyItem.studyId,
                    moduleId: studyItem.moduleId ? studyItem.moduleId : 'none',
                    sectionId: studyItem.sectionId ? studyItem.sectionId : 'none',
                    type: moduleType,
                    datetime: studyItem.datetime?.seconds || studyItem.startTrial?.seconds,
                    values: JSON.stringify(values)
                }
            )
        });
        
        downloadCsvFile(basedData);

    } catch (error) {
        console.log(error);
    }
}


function downloadCsvFile(csvData) {

    //define the heading for each row of the data  
    var csv = 'User ID;Study ID;Module ID;Section ID;Unix Date;Type;Data\n';

    //merge the data with CSV  
    csvData.forEach(function (row) {
        console.log("🚀 ~ file: index.ts:132 ~ row", row)
        csv += row.join(';');
        csv += "\n";
    });

    //display the created CSV data on the web browser   
    // document.write(csv);

    var hiddenElement = document.createElement('a');
    hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(csv);
    hiddenElement.target = '_blank';

    //provide the name for the CSV file to be downloaded  
    hiddenElement.download = 'Veris Test Result.csv';
    hiddenElement.click();
}