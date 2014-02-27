public  class testJson {
	@future(callout=true)
    public static void postOrder(id contactId ) {
    	contact orgContact=[Select FirstName,LastName,Title,Email From Contact Where Id=:contactId limit 1];
    	    if(orgContact.FirstName == null) orgContact.FirstName ='';
		    HttpRequest req = new HttpRequest();
		    req.setEndpoint('http://cfj-minihack.herokuapp.com');
		    req.setMethod('POST');
		    req.setHeader('Content-Type', 'application/json');
		    ContactBody conBody = new ContactBody(orgContact);
		    String jsonString = System.Json.serializePretty(conBody);
		    req.setBody(jsonString);
		    Http http = new Http();
		    HTTPResponse res = http.send(req);
			System.debug('Fulfillment service returned '+ res.getBody());
        }

    private class ContactBody {
        public String firstName {get; set;}
        public String lastName {get; set;}
        public String title {get; set;}
        public String email {get; set;}
        public String msg_type {get; set;}

        public ContactBody(Contact param){
            firstName = param.FirstName;
            lastName = param.LastName;
            title = param.Title;
            email = param.Email;
            msg_type = 'ceo alert';
        }
    }
}