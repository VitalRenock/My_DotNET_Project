using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoModelGlobal.Models
{
	public class UserGlobal
	{
		#region Properties
		
		public int Id { get; set; }
		public string LastName { get; set; }
		public string FirstName { get; set; }
		public string Email { get; set; }
		public string Password { get; set; } 

		#endregion
	}
}
