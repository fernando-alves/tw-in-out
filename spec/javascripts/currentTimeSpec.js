describe("Current Time", function() {
  var currentTime;
  beforeEach(function() {
    loadFixtures("new_punch.html");
    currentTime = new CurrentTime(new Date(2012, 4, 3, 9, 30));
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
    expect($("#punch_time_1i").val()).toBe("2012");
  });
  it("should set the current month", function() {
    currentTime.setCurrentTime();
    expect($("#punch_time_2i").val()).toBe("5");
  });
  it("should set the current date", function() {
    currentTime.setCurrentTime();
    expect($("#punch_time_3i").val()).toBe("3");
  });
  it("should set the current hours", function() {
    currentTime.setCurrentTime();
    expect($("#punch_time_4i").val()).toBe("09");
  });
  it("should set the current minutes", function() {
    currentTime.setCurrentTime();
    expect($("#punch_time_5i").val()).toBe("30");
  });
});
