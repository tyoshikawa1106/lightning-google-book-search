/**
 * Google Book Search
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
public with sharing class GoogleBookSearchHttpCalloutMock implements HttpCalloutMock {
    
    public HTTPResponse respond(HTTPRequest req) {
        
        String searchKey = 'salesforce';
        
        System.assertEquals('https://www.googleapis.com/books/v1/volumes?q=' + searchKey + '&orderBy=newest', req.getEndpoint());
        System.assertEquals('GET', req.getMethod());
        
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"salesforce":"good!"}');
        res.setStatusCode(200);
        return res;
    }
}