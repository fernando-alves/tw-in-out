describe("Current Time", function() {
  var currentTime;
  beforeEach(function() {
    loadFixtures("new_punch.html");
    currentTime = new CurrentTime(new Date(2012, 1, 1, 9, 30));
  });
  it("should load the template", function() {
    expect($('#punch')).toContain($("#punch_time_1i"));
    expect($('#punch')).toContain($("#punch_time_2i"));
    expect($('#punch')).toContain($("#punch_time_3i"));
    expect($('#punch')).toContain($("#punch_time_4i"));
    expect($('#punch')).toContain($("#punch_time_5i"));
  });
  it("should set the current year", function() {
    currentTime.setCurrentTime();
    expect($("#punch_time_1i option[value=2012]")).toBeSelected();
  });
  it("should set the current month", function() {
    currentTime.setCurrentTime();
    expect($("#punch_time_2i option[value=1]")).toBeSelected();
  });
  it("should set the current date", function() {
    currentTime.setCurrentTime();
    expect($("#punch_time_3i option[value=1]")).toBeSelected();
  });
  it("should set the current hours", function() {
    currentTime.setCurrentTime();
    expect($("#punch_time_4i option[value=09]")).toBeSelected();
  });
  it("should set the current minutes", function() {
    currentTime.setCurrentTime();
    expect($("#punch_time_5i option[value=30]")).toBeSelected();
  });
});
