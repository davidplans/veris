import { initializeApp } from "@firebase/app";
import { doc, getFirestore, getDocs, query, collectionGroup, where, collection, getDoc } from "@firebase/firestore";
import * as ld from 'lodash';

// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries


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


    var studyIdArray = [];
    var table = document.getElementById('myTable');
    docsModulesSnap.forEach(doc => {

        var id = doc.data().studyId;
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
    }
})();

async function getStudies(idStudy) {

    try {
        const queryModules = await query(collectionGroup(db, "studies"), where("studyId", "==", idStudy));
        const moduleSnapshot = await getDocs(queryModules);

        const basedData: any[] = [];

        for (const study of moduleSnapshot.docs) {
            console.log("🚀 ~ file: index.ts:76 ~ getStudies ~ study", study)
            const studyItem = study.data();
            const moduleType = studyItem.type;
            let values: any = [];

            if (moduleType === 'survey') {
                values = ld.map(studyItem.values, (item) => {
                    return {
                        questionId: item.questionId,
                        value: item.value
                    }
                })
            }

            if (moduleType === 'pat') {
                const formatedTrials: any = [];
                const userRef = collection(db, "users");
                const docRef = doc(userRef, `${studyItem.userId}/studies`, study.id);

                const trials = collection(docRef, 'trials');
                const trialsSnapshot = await getDocs(trials);

                trialsSnapshot.forEach((trial) => {
                    formatedTrials.push(trial.data());
                });
                values = {
                    baselines : studyItem.baselines,
                    trials: formatedTrials
                };
            }

            basedData.push(
                {
                    userId: studyItem.userId,
                    studyId: studyItem.studyId,
                    moduleId: studyItem.moduleId,
                    sectionId: studyItem.sectionId,
                    type: moduleType,
                    datetime: studyItem.datetime?.seconds || studyItem.startTrial?.seconds,
                    values: JSON.stringify(values)
                }
            );
        }
        
        saveArrAsCsv(basedData);

    } catch (error) {
        console.log("🚀 ~ file: index.ts:123 ~ getStudies ~ error", error)
    }
}

function createExportRows(dataSource: any, columns: any, separator: any) {
    const data    = dataSource;
    const newLine = '\r\n';
    let dataField;
    let content   = '';
    for (let j = 0; j < data.length; j++) {
        for (let i = 0; i < columns.length; i++) {
            dataField = columns[i];
            content  += `${i > 0 ? separator : ''}"${data[j][dataField] ? data[j][dataField] : 0}"`;
        }
        content += newLine;
    }
    return content;
}

function saveArrAsCsv(dataSource: any = [], name = 'veris-test-data') {
    const link      = document.createElement('a');
    const separator = ';';
    const columns: any   = [];

    ld.forEach(dataSource[0], (value: any, key: any) => {
        columns.push(key);
    });

    let content = createExportHeader(columns, separator);
    content    += createExportRows(dataSource, columns, separator);

    const blob = new Blob([content], { type: 'text/csv;charset=utf-8;' });
    const url  = URL.createObjectURL(blob);
    link.setAttribute('href', url);
    link.setAttribute('download', `${name}-${new Date()}.csv`);
    link.style.visibility = 'hidden';
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}

function createExportHeader(columns: any, separator: any) {
    let headerRow = '';
    const newLine = '\r\n';
    for (let i = 0; i < columns.length; i++) {
        headerRow += `${i > 0 ? separator : ''}"${columns[i]}"`;
    }
    return headerRow + newLine;
}