//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

namespace RallyPortal
{
    public partial class Comment
    {
        public int Id { get; set; }
        public string Content { get; set; }
        public System.DateTime PostDate { get; set; }
        public string AuthorName { get; set; }
        public string AuthorEmail { get; set; }
    
        public virtual Article Article { get; set; }
    }
    
}