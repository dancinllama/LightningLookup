({
	handleSearch : function(component) {
        var searchText = component.get("v.searchString");
        if(typeof searchText !== 'undefined' && searchText.length >= 3){
            var action = component.get("c.doSearch");
            action.setParams(
                {
                    searchText : component.get("v.searchString")
                    ,sobjectsToSearch : component.get("v.sobjectsToSearch")
                    ,icons : component.get("v.icons")
                    ,recordLimit : component.get("v.recordLimit")
                }
            );
            action.setCallback(this,function(a){
                component.set("v.records",a.getReturnValue());
            });
            $A.enqueueAction(action);
        }
	}
})