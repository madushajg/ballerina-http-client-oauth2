import ballerina/http;
import ballerina/test;
import ballerina/io;

final http:Client sampleEp = check new ("http://localhost:9090/hello/sayHello");

@test:Config {}
function testSample() returns error? {
    io:println("Testing ...");
    http:Response response = check sampleEp->get("/");
    test:assertEquals(response.statusCode, http:STATUS_OK);
    string payload = check response.getTextPayload();
    test:assertTrue(payload == "Hello Ballerina!");
}
