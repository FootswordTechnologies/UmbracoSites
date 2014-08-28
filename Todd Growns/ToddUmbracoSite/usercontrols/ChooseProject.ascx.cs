using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using umbraco.MacroEngines;
using umbraco.editorControls.userControlGrapper;

public partial class usercontrols_ChooseProject : System.Web.UI.UserControl, IUsercontrolDataEditor
{
    public string UmbracoValue = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            // load projects into the list
            _projects.Items.Insert(0, new ListItem("-- Select Project --", string.Empty));
            var children = GetProjects();
            _projects.DataSource = children;
            _projects.DataTextField = "Name";
            _projects.DataValueField = "Id";
            _projects.DataBind();
        }
        else if (Page.IsPostBack)
        {
            UmbracoValue = _projects.SelectedValue;
        }
        if(!UmbracoValue.Equals(string.Empty))
        {
            _projects.Items.FindByValue(UmbracoValue).Selected = true;
        }
    }

    // I want to return a list of projects, really.
    private static List<DynamicBackingItem> GetProjects()
    {
        var node = new DynamicNode(-1);
        var projects = node.Descendants("Projects").Items[0];
        // I assume there is only one node called "Projects" and that the direct children are all single projects.
        var children = projects.ChildrenAsList;

        return children;
    }

    public object value
    {
        get { return UmbracoValue; }
        set
        {
            if(value != null &&
                !string.IsNullOrEmpty(value.ToString()))
            {
                UmbracoValue = value.ToString();
            }
        }
    }
}