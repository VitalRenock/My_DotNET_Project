using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using DemoModelClient.Models;
using DemoWebAPI.Models;
using VitalTools.Mapper;

namespace DemoWebAPI.Mapper
{
	public class GameMapper : IMapper<GameClient, GameApi>
	{
		public override GameClient ToOrigin(GameApi origin)
		{
			return new GameClient(
				origin.Id,
				origin.Name,
				origin.Owner,
				origin.Console,
				origin.Price,
				origin.MaxPlayers,
				origin.Commentary
				);
		}

		public override GameApi ToTarget(GameClient target)
		{
			return new GameApi(
				target.Id,
				target.Name,
				target.Owner,
				target.Console,
				target.Price,
				target.MaxPlayers,
				target.Commentary
				);
		}
	}
}