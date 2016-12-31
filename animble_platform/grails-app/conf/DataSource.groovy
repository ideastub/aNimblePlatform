/*

aNimble Platform: Application Lifecycle Management Tool
Copyright (C) 2010-2012 ideaStub, LLC

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

*/

dataSource {
	pooled = true
	logSql = false

	//to use sql server, the following should be uncommented 
	//driverClassName = "com.microsoft.sqlserver.jdbc.SQLServerDriver"

	//to use mysql, the following should be uncommented
	driverClassName = "com.mysql.jdbc.Driver"

	username = "anp"
	password = "anp_0704"

}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
			dbCreate = ""
			//to use sql server, the following should be uncommented 
			//url = "jdbc:sqlserver://localhost:1433;databaseName=aNimble_Platform;";
			
			//to use mysql, the following should be uncommented
			url = "jdbc:mysql://localhost/aNimble_Platform?allowMultiQueries=true";
		}
	}
	test {
		dataSource {
			dbCreate = ""
			//to use sql server, the following should be uncommented 
			//url = "jdbc:sqlserver://localhost:1433;databaseName=aNimble_Platform;";
			
			//to use mysql, the following should be uncommented
			url = "jdbc:mysql://localhost/aNimble_Platform?allowMultiQueries=true";
		}
	}
	production {
		dataSource {
			dbCreate = ""
			//to use sql server, the following should be uncommented 
			//url = "jdbc:sqlserver://localhost:1433;databaseName=aNimble_Platform;";
			
			//to use mysql, the following should be uncommented
			url = "jdbc:mysql://localhost/aNimble_Platform?allowMultiQueries=true";
		}
	}
}