using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DemoModelGlobal.Mappers;
using DemoModelGlobal.Models;
using VitalTools.Database;
using VitalTools.Model.Services;

namespace DemoModelGlobal.Services
{
	public class AuthGlobalService : IServiceModelAUTH<UserGlobal>
	{
		#region Connection Properties
		
		Connection connection;
		string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=DemoDB;Integrated Security=True;"; 

		#endregion

		#region Constructor

		public AuthGlobalService()
		{
			connection = new Connection(SqlClientFactory.Instance, connectionString);
		} 

		#endregion

		public UserGlobal Login(string email, string password)
		{
			Command command = new Command("UserAuthentification", true);
			command.AddParameter("email", email);
			command.AddParameter("password", password);

			return connection.ExecuteReader(command, (dr) => dr.ToUserGlobal()).SingleOrDefault();
		}

		public bool Register(UserGlobal user)
		{
			Command command = new Command("UserRegister", true);
			command.AddParameter("lastName", user.LastName);
			command.AddParameter("firstName", user.FirstName);
			command.AddParameter("email", user.Email);
			command.AddParameter("password", user.Password);

			int rows = connection.ExecuteNonQuery(command);

			#region Reset password

			/* Reset du 'password' pour des raisons de sécurité.
			 * Le garbage collector ne supprimant pas immédiatement les variables,
			 * le password reste exposé un court temps même aprés la sortie de la méthode. 
			 */
			user.Password = null;

			#endregion

			return rows == 1;
		}
	}
}
