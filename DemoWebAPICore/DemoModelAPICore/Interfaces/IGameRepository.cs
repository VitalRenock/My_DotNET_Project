using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoModelAPICore.Interfaces
{
	public interface IGameRepository<TGame>
	{
		IEnumerable<TGame> Get();
		TGame Get(int id);
		TGame Get(string name);
	}
}