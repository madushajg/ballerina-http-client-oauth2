import ballerina/http;
import ballerina/io;

http:Client logAnalyticsEp = check new("http://localhost:9096/v1/workspaces", {
    auth: {
        tokenUrl: "http://localhost:9095/azureoauth2/token",
        clientId: "clid124",
        clientSecret: "clsc972"
    }
});

service /hello on new http:Listener(9090) {
    resource function get sayHello(http:Caller caller, http:Request request) {

        var logAnalyticsStatus = logAnalyticsEp->post("/query", {query: "print 1"});

        error? result = caller->respond("Hello Ballerina!");
        if (result is error) {
            io:println("Error in responding: ", result);
        }
    }
}
