CurrentTime = function(date) {
  this.year = date.getFullYear();
  this.month = date.getMonth();
  this.date = date.getDate();
  this.hours = date.getHours();
  this.minutes = date.getMinutes();
}

CurrentTime.prototype.setCurrentTime = function() {
  $("#punch_time_1i, #punch_time_2i, #punch_time_3i, #punch_time_4i, #punch_time_5i").find("option:selected").removeAttr("selected");

  $("#punch_time_1i option[value=" + this.year + "]").attr("selected", true);
  $("#punch_time_2i option[value=" + this.month + "]").attr("selected", true);
  $("#punch_time_3i option[value=" + this.date + "]").attr("selected", true);
  $("#punch_time_4i option[value=" + this.format(this.hours) + "]").attr("selected", true);
  $("#punch_time_5i option[value=" + this.format(this.minutes) + "]").attr("selected", true);
}

CurrentTime.prototype.format = function(value) {
  if (value < 10) {
    return "0" + value
  } else return value;
}
