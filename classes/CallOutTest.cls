@isTest
private class CallOutTest {
     @isTest static void testCallout() {
     	//create test data
        contact ct= new contact();
        ct.LastName = 'テスト';
        ct.FirstName= '太郎';
        ct.Title = 'CEO';
        ct.Email = 'iamddmc@126.com';
        insert ct;

        // Set mock callout class
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        Test.stopTest();

        testJson.postOrder(ct.id);

    }
}