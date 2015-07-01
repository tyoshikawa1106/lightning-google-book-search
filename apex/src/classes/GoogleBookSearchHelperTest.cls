/**
 * Google Book Search
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class GoogleBookSearchHelperTest {
    
    private static GoogleBookSearchHelper helper = new GoogleBookSearchHelper();
    private static User testAdminUser  = GoogleBookSearchTester.getLoginUser();
    
    /**
     * Get Google Books URL
     */
    static testMethod void getGoogleBooksUrlTest() {
    
        System.runAs(testAdminUser) {
            Test.startTest();

            String searchKey = 'salesforce.com';
            String result = helper.getGoogleBooksUrl(searchKey);
            System.assertEquals(result, 'https://www.googleapis.com/books/v1/volumes?q=' + searchKey + '&orderBy=newest');
            
            searchKey = '';
            result = helper.getGoogleBooksUrl(searchKey);
            System.assertEquals(result, 'https://www.googleapis.com/books/v1/volumes?q=&orderBy=newest');

            Test.stopTest();
        }
    }
    
    /**
     * Get HttpResponseBody
     */
    static testMethod void getHttpResponseBodyTest() {
    
        System.runAs(testAdminUser) {
            
            Test.setMock(HttpCalloutMock.class, new GoogleBookSearchHttpCalloutMock());
            
            Test.startTest();

            String searchKey = 'salesforce';
            String googleBookUrl = helper.getGoogleBooksUrl(searchKey);
            System.assertEquals(googleBookUrl, 'https://www.googleapis.com/books/v1/volumes?q=' + searchKey + '&orderBy=newest');
            
            String result = helper.getHttpResponseBody(googleBookUrl);
            System.assertNotEquals(String.isEmpty(result), true);

            Test.stopTest();
        }
    }
}