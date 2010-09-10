function current_time() {
  var today,hour,second,minute,year,month,date; 
  var strDate;
  today = new Date();
  var n_day = today.getDay();
  switch(n_day) {
    case 0: 
      strDate = "星期日";
      break;
    case 1:
      strDate = "星期一";
      break;
    case 2:
      strDate = "星期二";
      break;
    case 3:
      strDate = "星期三";
      break;
    case 4:
      strDate = "星期四";
      break;
    case 5:
      strDate = "星期五";
    case 6:
      strDate = "星期六";
    case 7:
      strDate = "星期日"
  }
  year = today.getYear();
  month = today.getMonth() + 1;
  date = today.getDate();
  hour = today.getHours();
  minute = today.getMinutes();
  second = today.getSeconds();

  /*return "当前时间: " + year + "年" + month + "月" + date + "日 " + hour + ":" + minute + "  " + n_day;*/
  return year
}
