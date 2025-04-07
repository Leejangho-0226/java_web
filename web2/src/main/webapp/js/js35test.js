window.onload = function(){
    document.querySelector("#frm").onchange = showFunc;
}

let xhr;
function showFunc(){
    // alert("test");
    xhr = new XMLHttpRequest();
    let fname = "js35test.jsp?gender=" + frm.gender.value;
    xhr.open("GET", fname, true);
    xhr.onreadystatechange = function(){
        if(xhr.readyState === 4 && xhr.status === 200){
            processFunc();
        }
    }
    xhr.send();
}

function processFunc(){
    let parseData = JSON.parse(xhr.responseText);
    // alert(parseData.jikwon.length);

    let str = `<table border="1">`;
    for(let i = 0; i < parseData.jikwon.length; i++){
        str += `<tr>`;
        str += `<td>${parseData.jikwon[i].jikwonno}</td>`;
        str += `<td>${parseData.jikwon[i].jikwonname}</td>`;
        str += `<td>${parseData.jikwon[i].jikwonjik}</td>`;
        str += `<td>${parseData.jikwon[i].jikwonyear}</td>`;
        str += `</tr>`;
    }
    str += `</table>`;
    document.querySelector("#disp").innerHTML = str;
}