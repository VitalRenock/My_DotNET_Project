using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DemoModelAPICore.Entities;
using DemoModelAPICore.Interfaces;
using DemoModelAPICore.Mappers;
using VitalTools.Database.Formation;

namespace DemoModelAPICore.Services
{
	public class GameRepository : IGameRepository<Game>
	{
		#region Connection
		
		private ConnectionFormation connection;

		#endregion

		#region Constructor

		public GameRepository(ConnectionFormation connectionFormation) => connection = connectionFormation;

		#endregion

		#region CRUD Methods
		
		public IEnumerable<Game> Get()
		{
			CommandFormation command = new CommandFormation("SELECT [Id], [Name], [Owner], Console, Price, MaxPlayers, Commentary FROM Game;");

			return connection.ExecuteReader(command, g => g.ToGame());
		}

		public Game Get(int id)
		{
			CommandFormation command = new CommandFormation("SELECT [Id], [Name], [Owner], Console, Price, MaxPlayers, Commentary FROM Game WHERE Id = @id;");
			command.AddParameter("id", id);

			return connection.ExecuteReader(command, g => g.ToGame()).SingleOrDefault();
		}

		public Game Get(string name)
		{
			CommandFormation command = new CommandFormation("SELECT [Id], [Name], [Owner], Console, Price, MaxPlayers, Commentary FROM Game WHERE Name = @name;");
			command.AddParameter("name", name);

			return connection.ExecuteReader(command, g => g.ToGame()).SingleOrDefault();
		}

		#endregion
	}
}
