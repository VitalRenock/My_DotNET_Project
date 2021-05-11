using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using DemoWebAPI.Models;

namespace DemoWebAPI.Infrastructure
{
    /// <summary>
    /// Classe ajoutant de nouvelles propriétés dans le 'HttpContext.Current.Session'
    /// </summary>
	public static class SessionManager
	{
        public static UserApi User
        {
            get { return (UserApi)HttpContext.Current.Session[nameof(User)]; }
            set { HttpContext.Current.Session[nameof(User)] = value; }
        }

        public static bool? IsAdmin
        {
            get { return (bool?)HttpContext.Current.Session[nameof(IsAdmin)]; }
            set { HttpContext.Current.Session[nameof(IsAdmin)] = value; }
        }
    }
}