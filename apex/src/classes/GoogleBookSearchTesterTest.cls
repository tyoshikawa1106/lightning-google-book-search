/**
 * Google Book Search
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class GoogleBookSearchTesterTest {
    
    private static User testAdminUser = GoogleBookSearchTester.getLoginUser();
    
    /**
     * Get LoginUser
     */
    static testMethod void getLoginUser() {
        
        System.runAs(testAdminUser) {
            Test.startTest();
            
            User result = GoogleBookSearchTester.getLoginUser();
            System.assertEquals(result.Id, UserInfo.getUserId());
            
            Test.stopTest();
        }
    }
}