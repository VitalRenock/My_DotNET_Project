using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoModelClient.Models
{
	public class UserClient
	{
		#region Properties
		
		public int Id { get; private set; }
		public string LastName { get; set; }
		public string FirstName { get; set; }
		public string Email { get; set; }
		public string Password { get; set; } 

		#endregion

		#region Constructors

		public UserClient(string lastName, string firstName, string email, string password)
		{
			LastName = lastName;
			FirstName = firstName;
			Email = email;
			Password = password;
		}

		internal UserClient(int id, string lastName, string firstName, string email)
			: this(lastName, firstName, email, null)
		{
			Id = id;
		} 

		#endregion
	}
}