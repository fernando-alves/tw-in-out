CurrentTime = function(date) {
  this.year = date.getFullYear();
  this.month = date.getMonth() + 1;
  this.date = date.getDate();
  this.hours = date.getHours();
  this.minutes = date.getMinutes();
}

CurrentTime.prototype.setCurrentTime = function() {
  $("#punch_time_1i, #punch_time_2i, #punch_time_3i, #punch_time_4i, #punch_time_5i").find("option:selected").removeAttr("selected");

  $("#punch_time_1i").val(this.year);
  $("#punch_time_2i").val(this.month);
  $("#punch_time_3i").val(this.date);
  $("#punch_time_4i").val(this.format(this.hours));
  $("#punch_time_5i").val(this.format(this.minutes));
}

CurrentTime.prototype.format = function(value) {
  if (value < 10) {
    return "0" + value
  } else return value;
}
