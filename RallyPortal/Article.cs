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
    public partial class Article
    {
        public Article()
        {
            this.Comment = new HashSet<Comment>();
        }
    
        public int Id { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public System.DateTime PublishedDate { get; set; }
        public System.DateTime LastModifiedDate { get; set; }
        public bool Published { get; set; }
        public string ImageUrl { get; set; }
        public string Author { get; set; }
    
        public virtual ICollection<Comment> Comment { get; set; }
    }
    
}
