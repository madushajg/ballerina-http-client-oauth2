import ballerina/http;

listener http:Listener azureLogAnalyticsEp = new(9096);

service /v1/workspaces on azureLogAnalyticsEp {

    resource function post query(http:Caller caller, http:Request req) returns error? {
        if (!req.hasHeader(http:AUTH_HEADER)) {
            return checkpanic caller->respond("Unauthorized");
        }
        json query = check <@untainted>req.getJsonPayload();
        return caller->respond("Success");
    }
}
