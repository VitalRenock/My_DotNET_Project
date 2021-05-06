using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

using DemoModelClient.Models;
using DemoModelClient.Services;
using DemoWebAPI.Mapper;
using DemoWebAPI.Models;
using VitalTools.Api.Controllers;

namespace DemoWebAPI.Controllers
{
    public class LoginController : AuthController<UserClient, UserApi>
    {
		// Constructor
		public LoginController()
		{
			Service = new AuthClientService();
			Mapper = new UserMapper();
		}

		// Authentification Methods
		public override UserApi Login(string pseudo, string password)
		{
			return base.Login(pseudo, password);
		}

		public override bool Register([FromBody] UserApi user)
		{
			bool result = base.Register(user);

			#region Nettoyage du 'Password' de la mémoire

			user.Password = null;

			#endregion

			return result;
		}
	}
}