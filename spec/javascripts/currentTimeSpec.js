describe("Current Time", function() {
  beforeEach(function() {
    loadFixtures("new_punch.html");
  });
  it("should load the template", function() {
    expect($('#punch')).toContain($("#punch_time_1i"));
    expect($('#punch')).toContain($("#punch_time_2i"));
    expect($('#punch')).toContain($("#punch_time_3i"));
    expect($('#punch')).toContain($("#punch_time_4i"));
    expect($('#punch')).toContain($("#punch_time_5i"));
  });
});
