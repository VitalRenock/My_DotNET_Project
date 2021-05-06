using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DemoModelClient.Mappers;
using DemoModelClient.Models;
using DemoModelGlobal.Services;
using VitalTools.Model.Services;

namespace DemoModelClient.Services
{
	public class AuthClientService : IServiceModelAUTH<UserClient>
	{
		#region Service Property

		AuthGlobalService globalService; 

		#endregion

		#region Constructor

		public AuthClientService()
		{
			globalService = new AuthGlobalService();
		}

		#endregion

		#region Authentification Methods
		
		public UserClient Login(string email, string password) => globalService.Login(email, password)?.ToClient();

		public bool Register(UserClient user)
		{
			bool result = globalService.Register(user.ToGlobal());

			#region Reset du password pour des raisons de sécurité

			user.Password = null;

			#endregion

			return result;
		} 

		#endregion
	}
}