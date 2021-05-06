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
	public class GameClientService : IServiceModelCRUD<GameClient>
	{
		#region Service Properties

		GameGlobalService gameGlobalService;

		#endregion

		#region Constructors

		public GameClientService()
		{
			gameGlobalService = new GameGlobalService();
		}

		#endregion

		#region CRUD Methods

		public IEnumerable<GameClient> GetAll()
		{
			return gameGlobalService.GetAll().Select(g => g.ToClient());
		}

		public GameClient Get(int id)
		{
			return gameGlobalService.Get(id).ToClient();
		}

		public int Add(GameClient game)
		{
			return gameGlobalService.Add(game.ToGlobal());
		}

		public bool	Edit(int id, GameClient game)
		{
			return gameGlobalService.Edit(id, game.ToGlobal());
		}

		public bool Delete(int id)
		{
			return gameGlobalService.Delete(id);
		}

		#endregion
	}
}