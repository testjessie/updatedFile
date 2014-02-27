/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 *
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest(seeAlldata = true)
private class minihackTest {

    static testMethod void myUnitTest() {
        // 商談を作成する
        opportunity oppo = new opportunity();
        oppo.Name = 'test';
        oppo.StageName = 'Prospecting';
        oppo.CloseDate =system.today();
        insert oppo;

        //画面を初期化する
        PageReference pageRef = Page.jQuery_minihack;
        Test.setCurrentPage(pageRef);
        ApexPages.StandardController sc = new ApexPages.StandardController(oppo);
        jquery_minihack testCon = new jquery_minihack(sc);
        ApexPages.currentPage().getParameters().put('id', oppo.id);

        //操作
        testCon.allProducts[0].selected = true;
        testCon.addProduct();
        testCon.selectedProducts[0].Quantity = 1;
        testCon.selectedProducts[0].SalesPrice =85000;
        testCon.createLineItems();

    }
}