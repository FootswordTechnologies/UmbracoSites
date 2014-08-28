﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Contact.ascx.cs" Inherits="uBlogsy.Web.usercontrols.uBlogsy.Contact" %>
<script type="text/C#" runat="server">
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        ((umbraco.UmbracoDefault)this.Page).ValidateRequest = false;
    }
</script>
<div class="uBlogsy_comment_form">
    <asp:MultiView ID="mvForm" runat="server" ActiveViewIndex="0">
        <asp:View ID="vwForm" runat="server">
            <div class="uBlogsy_row">
                <label for="<%= txtName.ClientID %>">
                    Name<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtName"
                        Display="Dynamic">*</asp:RequiredFieldValidator>
                </label>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </div>
            <div class="uBlogsy_row">
                <label for="<%= txtEmail.ClientID %>">
                    Email<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail"
                        Display="Dynamic">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                        Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                </label>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </div>
            <div class="uBlogsy_row">
                <label for="<%= txtWebsite.ClientID %>">
                    Website
                </label>
                <asp:TextBox ID="txtWebsite" runat="server">http://</asp:TextBox>
            </div>
            <div class="uBlogsy_row uBlogsy_tall">
                <label for="<%= txtMessage.ClientID %>">
                    Message<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail"
                        Display="Dynamic">*</asp:RequiredFieldValidator>
                </label>
                <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine"></asp:TextBox>
            </div>


            <div ID="DivSubscribe" class="uBlogsy_row uBlogsy_Subscribe" runat="server" >
               <asp:CheckBox ID="cbxSubscribe" runat="server" /> 
               <label for="<%= cbxSubscribe.ClientID %>">
                    Subscribe to comments
                </label>
            </div>

            <div class="uBlogsy_row">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
             </div>
        </asp:View>
        <asp:View ID="vwSuccess" runat="server">
            <a name="success">&nbsp;</a>
            <p>Thank you for your comment.</p>
        </asp:View>
        <asp:View ID="vwCommentsClosed" runat="server">
            <p>
                Comments have been closed for this post.</p>
        </asp:View>


         <asp:View ID="vwError" runat="server">
            <a name="error">&nbsp;</a>
            <p>
                An error occured while submiting your comment. Please try again later.</p>
        </asp:View>
        
        <asp:View ID="vwSpam">
            <a name="spam">&nbsp;</a>
            <p>Bad spambot! You're a very bad spambot!</p>
        </asp:View>

    </asp:MultiView>


    <asp:MultiView ID="mvUnsubscribe" runat=server>
     <asp:View ID="vwUnsubscribeSuccess" runat="server">
            <a name="unsubscribed">&nbsp;</a>
            <p>
                You have now been unsubscribed from notifications about this post.</p>
        </asp:View>
         <asp:View ID="vwUnsubscribeError" runat="server">
            <a name="unsubscribed">&nbsp;</a>
            <p>
                The details in the unsubscribe link are not valid. </p>
        </asp:View>
        <asp:View ID="vwUnsubscribeError2" runat="server">
            <a name="unsubscribed">&nbsp;</a>
            <p>
                An error occured while unsubscribing you. Please try again later </p>
        </asp:View>
    </asp:MultiView>
</div>
