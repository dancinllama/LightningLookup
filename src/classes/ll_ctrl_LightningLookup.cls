public class ll_ctrl_LightningLookup{
    /**
	 * @description Uses SOSL to search for "searchText" using the sobjectsToSearch parameter.
	 * Wraps the results in an sObjectResult, which will contain the sobject record, in addition to the icon associated with it (represented by the icons array).
	 * The icons array is used for displaying the results in the LightningLookup component.
	 * Note the sobjectsToSearchFor and icons parameters are currently strings instead of arrays, because there is a defect when lightning controller classes try to
	 * serialize the arrays into an aura enabled method parameter (See: http://salesforce.stackexchange.com/questions/55464/sobject-array-parameter-in-lightning-causes-internal-salesforce-com-error-in-ape) 
     */
	@AuraEnabled
	public static List<sObjectResult> doSearch(String searchText,String sobjectsToSearch,String icons,String recordLimit){
		System.debug('JWL: in do Search');
        List<sObjectResult> ans = new List<sObjectResult>();
        
            
        String fields = '';
           
        System.debug('JWL: sobjectsToSearch: ' + sobjectsToSearch);
	    for(String sobjectToSearch : (List<String>)JSON.deserialize(sobjectsToSearch,List<String>.class)){
    	    fields += (String.isEmpty(fields) ? '' : ',') + sobjectToSearch + '(Id,Name)';
        }
            
        System.debug('JWL: icons: ' + icons);
        List<String> iconsArr = (List<String>)JSON.deserialize(icons,List<String>.class);
        
        String query = 'Find :searchText Returning ' + fields + ' Limit ' + recordLimit;
        System.debug('JWL: query: ' + query);

        Integer i=0;
        for(List<sObject> records : search.query(query)){
            for(sObject record : records){
                ans.add(new sObjectResult(record,iconsArr.get(i)));
            }
            i++;
        }
        return ans;
    }
    
    public class sObjectResult{
        @AuraEnabled
        public sObject record {get; private set;}
        @AuraEnabled
        public String icon {get; private set;}
        
        public sObjectResult(sObject record,String icon){
            this.record = record;
            this.icon = icon;
        }
    }
}
