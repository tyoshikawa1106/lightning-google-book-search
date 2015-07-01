({
    doSearch : function(component) {
        var searchField = component.find('searchText');
        var searchText = searchField.get('v.value');
        
        component.set("v.objects", null);
        
        if (!searchText) {
            return false;
        }
        
        var action = component.get("c.getBookList");
        action.setParams({
            "searchText": searchText
        });
        
        action.setCallback(this, function(data) {
            var result = data.getReturnValue();
            component.set("v.objects", result);
            console.log(result);
        });
        
        $A.enqueueAction(action);
    }
})