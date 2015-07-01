/**
 * Google Book Search
 * © Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class GoogleBookSearchTester {
    
    /**
     * Get LoginUser
     */
    public static User getLoginUser() {
        return new User(Id = UserInfo.getUserId());
    }
}