trigger createContact on Contact (after insert, after update) {
    public list<id> conToNotifyId = new list<id>();
    for(Contact ct:Trigger.new){
        String ctTitle = ct.Title;
        if(ctTitle == null){
            ctTitle ='';
        }
        if(ctTitle.equalsIgnoreCase('CEO')){
        	if(!Test.isRunningTest()){
        	    testJson.postOrder(ct.id);
        	}

        }
    }
}