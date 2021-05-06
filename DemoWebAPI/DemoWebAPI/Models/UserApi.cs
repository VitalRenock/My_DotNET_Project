using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace DemoWebAPI.Models
{
	public class UserApi
	{
		#region Properties
		
		[Required]
		public string LastName { get; set; }
		[Required]
		public string FirstName { get; set; }
		[Required]
		[EmailAddress]
		public string Email { get; set; }
		[Required]
		public string Password { get; set; } 

		#endregion

		#region Constructor
		
		public UserApi(string lastName, string firstName, string email, string password)
		{
			LastName = lastName;
			FirstName = firstName;
			Email = email;
			Password = password;
		}

		#endregion
	}
}