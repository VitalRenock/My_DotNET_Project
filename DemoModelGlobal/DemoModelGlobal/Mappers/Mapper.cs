using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DemoModelGlobal.Models;

namespace DemoModelGlobal.Mappers
{
	public static class Mapper
	{
		#region Game Mapper
		
		public static GameGlobal ToGameGlobal(this IDataRecord dataRecord)
		{
			return new GameGlobal()
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

		#endregion

		#region User Mapper

		public static UserGlobal ToUserGlobal(this IDataRecord dataRecord)
		{
			return new UserGlobal()
			{
				Id =			(int)dataRecord["Id"],
				LastName =		(string)dataRecord["LastName"],
				FirstName =		(string)dataRecord["FirstName"],
				Email =			(string)dataRecord["Email"],
				Password =		(string)dataRecord["Password"]
			};
		}

		#endregion
	}
}