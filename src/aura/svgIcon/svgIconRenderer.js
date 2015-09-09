({
    afterRender: function(component, helper) {
        var svg = component.find("svg_content");
        var value = svg.getElement().innerText;
        value = value.replace("<![CDATA[", "").replace("]]>", "");
        svg.getElement().outerHTML = value;        
    }
})