using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using VitalTools.Database;
using DemoModelGlobal.Models;
using DemoModelGlobal.Mappers;
using System.Data.SqlClient;
using VitalTools.Model.Services;

namespace DemoModelGlobal.Services
{
	public class GameGlobalService : IServiceModelCRUD<GameGlobal>
	{
		#region Connection Properties

		Connection connection;
		string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=DemoDB;Integrated Security=True;";
		
		#endregion

		#region Constructors

		public GameGlobalService()
		{
			connection = new Connection(SqlClientFactory.Instance, connectionString);
		}

		#endregion

		#region CRUD Methods

		public IEnumerable<GameGlobal> GetAll()
		{
			Command command = new Command("SELECT * FROM Game");

			return connection.ExecuteReader(command, g => g.ToGameGlobal());
		}

		public GameGlobal Get(int id)
		{
			Command command = new Command("SELECT * FROM Game WHERE Id = @id");
			command.AddParameter("id", id);

			return connection.ExecuteReader(command, g => g.ToGameGlobal()).SingleOrDefault();
		}

		public int Add(GameGlobal game)
		{
			Command command = new Command("INSERT INTO Game (Name, Owner, Console, Price, MaxPlayers, Commentary) OUTPUT INSERTED.Id VALUES (@name, @owner, @console, @price, @maxPlayers, @commentary);");
			command.AddParameter("name", game.Name);
			command.AddParameter("owner", game.Owner);
			command.AddParameter("console", game.Console);
			command.AddParameter("price", game.Price);
			command.AddParameter("maxPlayers", game.MaxPlayers);
			command.AddParameter("commentary", game.Commentary);

			return (int)connection.ExecuteScalar(command);
		}

		public bool Edit(int id, GameGlobal game)
		{
			string query = $"UPDATE Game SET" +
				$" Name = @name," +
				$" Owner = @owner," +
				$" Console = @console," +
				$" Price = @price," +
				$" MaxPlayers = @maxPlayers," +
				$" Commentary = @commentary" +
				$" WHERE Id = @id";

			Command command = new Command(query);
			command.AddParameter("id", id);
			command.AddParameter("name", game.Name);
			command.AddParameter("owner", game.Owner);
			command.AddParameter("console", game.Console);
			command.AddParameter("price", game.Price);
			command.AddParameter("maxPlayers", game.MaxPlayers);
			command.AddParameter("commentary", game.Commentary);

			// Quoi qu'il arrive le resultat sera le nbr de ligne modifié
			// pour renvoyer un boolean, je fais un test == 1
			return connection.ExecuteNonQuery(command) == 1;
		}

		public bool Delete(int id)
		{
			Command command = new Command("DELETE FROM Game WHERE Id = @id;");
			command.AddParameter("id", id);
			return connection.ExecuteNonQuery(command) == 1;
		}

		#endregion
	}
}
