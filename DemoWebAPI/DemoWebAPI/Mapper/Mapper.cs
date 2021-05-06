using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using DemoModelClient.Models;
using DemoWebAPI.Models;

namespace DemoWebAPI.Mapper
{
	public static class Mapper
	{
		#region Game Mapper

		public static GameApi ToApi(this GameClient game)
		{
			return new GameApi(
				game.Id,
				game.Name,
				game.Owner,
				game.Console,
				game.Price,
				game.MaxPlayers,
				game.Commentary
				);
		}

		public static GameClient ToClient(this GameApi game)
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

		#endregion

		#region User Mapper

		public static UserApi ToUserApi(this UserClient user)
		{
			return new UserApi(
				user.LastName,
				user.FirstName,
				user.Email,
				user.Password
				);
		}

		public static UserClient ToUserClient(this UserApi user)
		{
			return new UserClient(
				user.LastName,
				user.FirstName,
				user.Email,
				user.Password
				);
		}

		#endregion
	}
}