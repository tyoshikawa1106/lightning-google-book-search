/**
 * Google Book Search
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class GoogleBookSearchController {
    
    private static GoogleBookSearchHelper helper = new GoogleBookSearchHelper();
    
    /**
     * Constructor
     */
    public GoogleBookSearchController() {
        
    }
    
    /**
     * Get Google Book List
     */
    @AuraEnabled
    public static List<Object> getBookList(String searchText) {
        
        // Check SearchText
        if (String.isEmpty(searchText)) return new List<Object>();
        
        // Get Google Books URL
        String googleBooksUrl = helper.getGoogleBooksUrl(searchText);
        
        // Get Google Books Info
        String httpResponseBody = helper.getHttpResponseBody(googleBooksUrl);
        // Check Google Books Info
        if (String.isEmpty(httpResponseBody)) return new List<Object>();
        
        // Get Results
        Map<String, Object> rootMap = (Map<String, Object>)JSON.deserializeUntyped(httpResponseBody);
        List<Object> items = rootMap.containskey('items') ? (List<Object>)rootMap.get('items') : new List<Object>();
        
        return items;
    }
}