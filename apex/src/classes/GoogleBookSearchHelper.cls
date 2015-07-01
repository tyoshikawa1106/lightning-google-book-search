/**
 * Google Book Search
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class GoogleBookSearchHelper {
    
    /**
     * Constructor
     */
    public GoogleBookSearchHelper() {
        
    }
    
    /**
     * Get Google Books URL
     */
    public String getGoogleBooksUrl(String searchKey) {
        
        String result = '';
        result += 'https://www.googleapis.com/books/v1/volumes?q=';
        result += searchKey;
        result += '&orderBy=newest';
        
        return result;
    }
    
    /**
     * Get HttpResponseBody
     */
    public String getHttpResponseBody(String prmGoogleBooksUrl) {
        
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(prmGoogleBooksUrl);
        req.setMethod('GET');
        HttpResponse res = http.send(req);
        String result = res.getBody();
        
        return result;
    }
}