/**
 * Google Book Search
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class GoogleBookSearchControllerTest {
    
    private static User testAdminUser  = GoogleBookSearchTester.getLoginUser();
    
    /**
     * Constructor
     */
    static testMethod void GoogleBookSearchControllerTest() {
    
        System.runAs(testAdminUser) {
            Test.startTest();

            GoogleBookSearchController cls = new GoogleBookSearchController();

            Test.stopTest();
        }
    }
    
    /**
     * Get Google Book List
     */
    static testMethod void getBookListTest1() {
    
        System.runAs(testAdminUser) {
            
            Test.setMock(HttpCalloutMock.class, new GoogleBookSearchHttpCalloutMock());
            
            Test.startTest();

            String searchText = 'salesforce';
            List<Object> results = GoogleBookSearchController.getBookList(searchText);

            Test.stopTest();
            
            System.assertEquals(results.isEmpty(), true);
        }
    }
}