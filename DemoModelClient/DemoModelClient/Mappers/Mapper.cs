using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DemoModelClient.Models;
using DemoModelGlobal.Models;

namespace DemoModelClient.Mappers
{
	public static class Mapper
	{
		#region Game Mapper

		public static GameClient ToClient(this GameGlobal game)
		{
			return new GameClient(
				game.Id,
				game.Name,
				game.Owner,
				game.Console,
				game.Price,
				game.MaxPlayers,
				game.Commentary
				);
		}

		public static GameGlobal ToGlobal(this GameClient game)
		{
			return new GameGlobal()
			{
				Id = game.Id,
				Name = game.Name,
				Owner = game.Owner,
				Console = game.Console,
				Price = game.Price,
				MaxPlayers = game.MaxPlayers,
				Commentary = game.Commentary
			};
		}

		#endregion

		#region User Mapper

		public static UserGlobal ToGlobal(this UserClient user)
		{
			return new UserGlobal()
			{
				Id = user.Id,
				LastName = user.LastName,
				FirstName = user.FirstName,
				Email = user.Email,
				Password = user.Password
			};
		}

		public static UserClient ToClient(this UserGlobal user)
		{
			return new UserClient(user.Id, user.LastName, user.FirstName, user.Email);
		}

		#endregion
	}
}