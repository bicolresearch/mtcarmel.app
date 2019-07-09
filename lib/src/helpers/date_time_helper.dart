enum MonthEnum {
  JANUARY,
  FEBRUARY,
  MARCH,
  APRIL,
  MAY,
  JUNE,
  JULY,
  AUGUST,
  SEPTEMBER,
  OCTOBER,
  NOVEMBER,
  DECEMBER,
}

enum DayEnum {
  SUNDAY,
  MONDAY,
  TUESDAY,
  WEDNESDAY,
  THURSDAY,
  FRIDAY,
  SATURDAY,
}

enum DateFormatEnum{
  MMDDYYYY,
  DDMMYYYY,
  YYYYDDMM,
  YYYYMMDD
}

class DateTimeHelper {
  String dateString(DateTime dateTime, DateFormatEnum dateFormat) {
    switch(dateFormat){

      case DateFormatEnum.MMDDYYYY:
        return "${dateTime.month}-${dateTime.day}-${dateTime.year}";
        break;
      case DateFormatEnum.DDMMYYYY:
        return "${dateTime.day}-${dateTime.month}-${dateTime.year}";
        break;
      case DateFormatEnum.YYYYDDMM:
        return "${dateTime.year}-${dateTime.day}-${dateTime.month}";
        break;
      case DateFormatEnum.YYYYMMDD:
        return "${dateTime.year}-${dateTime.month}-${dateTime.day}";
        break;
    }
    return dateTime.toString();
  }

  String dayString(DateTime dateTime) {
    return dateTime.day.toString();
  }

  String monthString(DateTime dateTime) {
    String month = dateTime.month.toString();
    switch (dateTime.month) {
      case 0:
        return "January";
        break;
      case 1:
        return "February";
        break;
      case 2:
        return "March";
        break;
      case 3:
        return "April";
        break;
      case 4:
        return "May";
        break;
      case 5:
        return "Jun";
        break;
      case 6:
        return "July";
        break;
      case 7:
        return "August";
        break;
      case 8:
        return "September";
        break;
      case 9:
        return "October";
        break;
      case 10:
        return "November";
        break;
      case 11:
        return "December";
        break;
    }
    return month;
  }

  String shortMonthString(DateTime dateTime) {
    String month = dateTime.month.toString();
    switch (dateTime.month) {
      case 0:
        return "Jan";
        break;
      case 1:
        return "Feb";
        break;
      case 2:
        return "Mar";
        break;
      case 3:
        return "Apr";
        break;
      case 4:
        return "May";
        break;
      case 5:
        return "Jun";
        break;
      case 6:
        return "Jul";
        break;
      case 7:
        return "Aug";
        break;
      case 8:
        return "Sep";
        break;
      case 9:
        return "Oct";
        break;
      case 10:
        return "Nov";
        break;
      case 11:
        return "Dec";
        break;
    }
    return month;
  }

  String timeString(DateTime dateTime) {
    return "${dateTime.hour}:${dateTime.minute}:${dateTime.second}";
  }
}
