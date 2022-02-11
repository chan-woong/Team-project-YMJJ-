/**
 * 
 */

let today = new Date();
let year = today.getFullYear(); // 년도
let month1 = today.getMonth() + 1;  // 월
let date1 = today.getDate();  // 날짜
let today2 = new Date(today.setDate(today.getDate() - 3));
let month2 = today2.getMonth() + 1;  // 월
let date2 = today2.getDate();  // 날짜
if(month1 < 10) month1 = '0'+month1;
if(date1 < 10) date1 = '0'+date1;
if(month2 < 10) month2 = '0'+month2;
if(date2 < 10) date2 = '0'+date2;
let day1 = year + month1 + date1;
let day2 = year + month2 + date2;


var xhr = new XMLHttpRequest();
function toServer() {
	var url = 'http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson'; /*URL*/
	var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'iEcfXuGJalP7M6bBshTuqNRxSp%2BGlxbHG1TUf8Uo123RCP5noez%2BTb6y5o0VJRXz3c%2B2dVDe426qvPvt2k06Iw%3D%3D'; /*Service Key*/
	queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
	queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); /**/
	queryParams += '&' + encodeURIComponent('startCreateDt') + '=' + encodeURIComponent(day2); /**/
	queryParams += '&' + encodeURIComponent('endCreateDt') + '=' + encodeURIComponent(day1); /**/
	queryParams += '&_type=json'; /**/
	xhr.open('GET', url + queryParams);
	
	xhr.send('');
	}

xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
        //alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
		var arr=JSON.parse(xhr.responseText);
		//alert(xhr.responseText);
		//alert("오늘날짜 day1 : " + day1);
		//alert("전날짜 day2 : " + day2);
		//alert(arr.response.body.items.item);
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
		new Chart(document.getElementById("mixed-chart"), {
			type: 'bar',
			 data: {
			  labels: [dates[3],dates[2],dates[1],dates[0]],
			  datasets: [{
			  	 label: "제주 사망자",
		          type: "line",
		          borderColor: "#f74545",
		          data: [jejudeathCnt[3],jejudeathCnt[2],jejudeathCnt[1],jejudeathCnt[0]],
		          fill: false
		        }, {
		          label: "제주 확진자",
		          type: "bar",
		          backgroundColor: "rgba(69, 226, 247, 0.81)",
		          data: [jejudefCnt[3],jejudefCnt[2],jejudefCnt[1],jejudefCnt[0]],
		        }
			  ]
			},
			options: {
			  title: {
			    display: true,
			    text: 'Population growth (millions): Europe & Africa'
			  },
			  legend: { display: false }
			}
		});
    }
};
