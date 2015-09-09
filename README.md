# LightningLookup
A lightning component for quick lookup functionality.  Uses SOSL, Lightning components, and the Salesforce Lightning Design System (SLDS).  Also, works with generic sObjects.

<p>A couple of notes:
<ol>
<li>
You will need to adjust the ltng:require tag to use the correct path to your LightningDesignSystem static resource.  This should be done in both svgIcon.cmp as well as LightningLookup.cmp.
</li>
<li>
If you have a namespace in your org, you should adjust c:svgIcon references in LightningLookup.cmp to use your existing namespace.  e.g., instead use mynamespace:svgIcon
</li>
</ol>
<p>Here's an example of calling the LightningLookup from another Lightning Component:

<pre>&lt;c:lightningLookup icons="[&amp;quot;standard-sprite/svg/symbols.svg#product&amp;quot;]" sobjectsToSearch="[&amp;quot;Product2&amp;quot;]" recordLimit="5" title="Products" /&gt;</pre>
</p>
<p>
<a href="https://githubsfdeploy.herokuapp.com?owner=dancinllama&amp;repo=LightningLookup">
  <img alt="Deploy to Salesforce" src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/src/main/webapp/resources/img/deploy.png" style="max-width:100%;">
</a>
</p>
