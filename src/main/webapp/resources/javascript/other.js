var xhr = new XMLHttpRequest();

let today = new Date();
let year = today.getFullYear(); // 년도
let month = today.getMonth() + 1;  // 월
let date = today.getDate();  // 날짜
if(month < 10) month = '0'+month;
if(date < 10) date = '0'+date;
let day = year + month + date;
function toServer() {
	var url = 'http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson'; /*URL*/
	var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'iEcfXuGJalP7M6bBshTuqNRxSp%2BGlxbHG1TUf8Uo123RCP5noez%2BTb6y5o0VJRXz3c%2B2dVDe426qvPvt2k06Iw%3D%3D'; /*Service Key*/
	queryParams += '&' + encodeURIComponent('startCreateDt') + '=' + encodeURIComponent(day); /**/
	queryParams += '&' + encodeURIComponent('endCreateDt') + '=' + encodeURIComponent(day); /**/
	queryParams += '&_type=json' /**/
	//alert(queryParams);
	xhr.open('GET', url + queryParams);
	
	xhr.send('');
	}

xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
        //alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
		var arr=JSON.parse(xhr.responseText);
		//alert("오늘날짜 : " + day1);
		//alert("전날짜 : " + day2);
		//alert(arr.response.body.items.item.length);
		var jejucount = 0;
		var allcount = 0;
		var dates = new Array();
		var jejudeathCnt = new Array();
		var jejudefCnt = new Array();
		for (var i = 0; i < arr.response.body.items.item.length; i++) {
			if(arr.response.body.items.item[i].gubun=='제주'){
				dates[jejucount] = arr.response.body.items.item[i].createDt.substr(0, 10);
				jejudeathCnt[jejucount] = arr.response.body.items.item[i].deathCnt;
				jejudefCnt[jejucount] = arr.response.body.items.item[i].incDec;
				jejucount++;
			}
		}
		document.getElementById("todayCovid").innerHTML = "Today Covid-19 : " + jejudefCnt[0];
    }
};

function search(root) {
	var RTname = document.getElementById('RTname').value;
	
    var url= root+"/other/selectRestaurnat.do?RTname="+RTname;
    location.href=url;
}