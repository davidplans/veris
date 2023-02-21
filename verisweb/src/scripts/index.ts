import { initializeApp } from "@firebase/app";
import { doc, getFirestore, getDocs, query, collectionGroup, where, collection, getDoc } from "@firebase/firestore";
import * as ld from 'lodash';


const urlParams = new URLSearchParams(window.location.search);
const apiKey = urlParams.get('apiKey') || 'AIzaSyA-59XTB519YapZt9qXgSRXc3qF9q5IhC8';

// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries


// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
    apiKey: apiKey,
    authDomain: "digit-veris.firebaseapp.com",
    projectId: "digit-veris",
    storageBucket: "digit-veris.appspot.com",
    messagingSenderId: "270328431400",
    appId: "1:270328431400:web:5bfb1402730272437c461d",
    measurementId: "G-0LV9JLSHBW"
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

    finishLoading();
})();

async function getStudies(idStudy) {

    startLoading();

    try {
        const queryModules = await query(collectionGroup(db, "studies"), where("studyId", "==", idStudy));
        const moduleSnapshot = await getDocs(queryModules);

        const basedData: any[] = [];

        for (const study of moduleSnapshot.docs) {
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
                    values: values
                }
            );
        }

        const order = 'desc'; // 'asc'
        saveAsJson(ld.orderBy(basedData, 'datetime', [order]));
        finishLoading();

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

function saveAsJson(dataSource: any = [], name = 'veris-test-data') {
    const link      = document.createElement('a');
    const blob = new Blob([JSON.stringify(dataSource)], { type: 'text/json;charset=utf-8;' });
    const url  = URL.createObjectURL(blob);
    link.setAttribute('href', url);
    link.setAttribute('download', `${name}-${new Date().getTime()}.json`);
    emulateSaveClick(link);
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
    link.setAttribute('download', `${name}-${new Date().getTime()}.csv`);
    emulateSaveClick(link);
}

function emulateSaveClick(link: HTMLAnchorElement) {
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

function show (id) {
    const el = document.getElementById(id);
    el?.classList.remove('hide');
    el?.classList.add('show');
}

function hide (id) {
    const el = document.getElementById(id);
    el?.classList.remove('show');
    el?.classList.add('hide');
}

function startLoading() {
    hide('main');
    show('loader');
}

function finishLoading() {
    hide('loader');
    show('main');
}