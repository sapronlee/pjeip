function current_time() {
  var today = new Date()
	var year = today.getFullYear();
	var month = today.getMonth() + 1;
	var day = today.getDate();
	var hour = checkTime(today.getHours())
	var minute = checkTime(today.getMinutes())
	var second = checkTime(today.getSeconds())
	var weekday = new Array(7)
	weekday[0] = "日"
	weekday[1] = "一"
	weekday[2] = "二"
	weekday[3] = "三"
	weekday[4] = "四"
	weekday[5] = "五"
	weekday[6] = "六"
  return "当前时间： " + year + "年" + month + "月" + day + "日 " + hour + "：" + minute + "：" + second + "  星期" + weekday[today.getDay()]
}

function checkTime(i) {
	if (i < 10) {
		i="0" + i
	}
  return i
}

