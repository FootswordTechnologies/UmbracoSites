<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SystemItemSelector.ascx.cs" Inherits="Umbraco.Courier.UI.Usercontrols.SystemItemSelector" %>

<asp:Repeater ID="rpItems" runat="server" OnItemDataBound="RenderItemChildren">
<HeaderTemplate>

<%if (!this.IsChildList){%>
<div id="systemItemSelectorDiv" class="systemItemSelectorDiv">
<% } %>
<ul>
</HeaderTemplate>

<FooterTemplate>
</ul>
<%if (!this.IsChildList){%></div>

<script type="text/javascript" src="../scripts/jquery-ui.custom.min.js"></script>
<script type="text/javascript" src="../scripts/jquery.dynatree.min.js"></script>

<script type="text/javascript">
    jQuery(document).ready(function () {
        var selectedChildItems = jQuery(".systemItemSelectorTextBox");
        var inEventHandler = false;

        jQuery('#systemItemSelectorDiv').dynatree(
            {
                imagePath: " ",
                <% if(!this.LinkList){ %>
                checkbox: true,
                selectMode: 2,
                onSelect: function(select, dtnode) {
                    // Ignore, if this is a recursive call
                    if(inEventHandler) 
                        return;
                    // Select all children of currently selected node
                    try {
                        inEventHandler = true;
                        var selected = dtnode.bSelected;
                                                   
                        dtnode.visit(function(childNode){
                            childNode.select(selected);
                        });
                    }finally {
                         inEventHandler = false;
                    }

                    processCheckedNodes(dtnode.tree.getSelectedNodes());
                }

                <%}else{%>
                onActivate: function(node) {
                    processSelectedNode(node.data.key);
                    return false;
                }
                <%} %>
            }
         );
    });
</script>

<%}%>
</FooterTemplate>

<ItemTemplate>
    <li class="item" parent="<%= ParentID %>" id="<%# ((Umbraco.Courier.Core.SystemItem)Container.DataItem).ItemId.ToString() %>" data="parent:'<%= ParentID %>', icon:'<%= umbraco.IO.IOHelper.ResolveUrl(umbraco.IO.SystemDirectories.Umbraco + "/images/umbraco/")%><%# ((Umbraco.Courier.Core.SystemItem)Container.DataItem).Icon %>'"><%# ((Umbraco.Courier.Core.SystemItem)Container.DataItem).Name %>
        <asp:PlaceHolder ID="phChildren" runat="server"></asp:PlaceHolder>
    </li>
</ItemTemplate>
</asp:Repeater>

