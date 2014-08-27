using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using umbraco.MacroEngines;

/// <summary>
/// http://www.diplo.co.uk/blog/2011/6/21/creating-a-paged-list-in-umbraco-using-razor.aspx
/// </summary>
namespace Diplo{
    public static class RazorExtensions
    {
        public static DynamicNodeList Paged(this DynamicNodeList nodes, int page, int pageSize)
        {
            return new DynamicNodeList(nodes.Items.Skip((page - 1) * pageSize).Take(pageSize));
        }
    }
}
