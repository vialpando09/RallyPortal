using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RallyPortal.Controllers
{
    public class BaseController : Controller
    {
        protected ModelContainer db = new ModelContainer();
    }
}
