using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using DemoModelAPICore.Entities;
using DemoModelAPICore.Interfaces;

namespace DemoWebAPICore.Models
{
	public class GameRepositoryClient
	{
		#region Connection
		
		private readonly IGameRepository<Game> gameRepository;

		#endregion

		#region Constructor

		public GameRepositoryClient(IGameRepository<Game> gameRepository) => this.gameRepository = gameRepository;

		#endregion

		public IEnumerable<GameApiCore> Get() => gameRepository.Get().Select(g => new GameApiCore(g.Id, g.Name, g.Owner, g.Console, g.Price, g.MaxPlayers, g.Commentary)); 

		public GameApiCore Get(int id)
		{
			Game game = gameRepository.Get(id);

			if (game is null) return null;

			return new GameApiCore(game.Id, game.Name, game.Owner, game.Console, game.Price, game.MaxPlayers, game.Commentary);
		}

		public GameApiCore Get(string name)
		{
			Game game = gameRepository.Get(name);

			if (game is null) return null;

			return new GameApiCore(game.Id, game.Name, game.Owner, game.Console, game.Price, game.MaxPlayers, game.Commentary);
		}
	}
}
