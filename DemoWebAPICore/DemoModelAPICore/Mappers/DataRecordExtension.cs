using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DemoModelAPICore.Entities;

namespace DemoModelAPICore.Mappers
{
	internal static class DataRecordExtension
	{
        internal static Game ToGame(this IDataRecord dataRecord)
        {
			return new Game() 
			{
				Id =			(int)dataRecord["Id"],
				Name =			(string)dataRecord["Name"],
				Owner =			(string)dataRecord["Owner"],
				Console =		(string)dataRecord["Console"],
				Price =			(int)dataRecord["Price"],
				MaxPlayers =	(int)dataRecord["MaxPlayers"],
				Commentary =	(string)dataRecord["Commentary"]
			};
		}
    }
}
