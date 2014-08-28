describe ("LocationManager", function() {
  it("has a transport_mode", function() {
    expect(LocationManager.transport_mode).toBeDefined();
  });
  it("has a start lat & lng", function() {
    expect(LocationManager.start.lat).toBeDefined();
    expect(LocationManager.start.lng).toBeDefined();
  });
  it("has an end lat & lng", function() {
    expect(LocationManager.end.lat).toBeDefined();
    expect(LocationManager.end.lng).toBeDefined();
  });
});