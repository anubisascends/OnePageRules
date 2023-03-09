using Microsoft.Extensions.Configuration;
using OnePageRules_WebAPI.Repositories;
using OnePageRules_WebAPI.Repositories.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnePageRules_Tests
{
    public class RepositoryTests
    {
        IConfiguration configuration;

        public RepositoryTests()
        {
            var jsonFile = Path.Combine(AppContext.BaseDirectory, "appsettings.Development.json");

            configuration = new ConfigurationBuilder()
                .AddJsonFile(jsonFile)
                .Build();

        }

        [Fact]
        public void SQLRepository_GetGame_Success()
        {
            // arrange
            var repository = new SqlRepository(configuration);

            // act
            var result = repository.GetGames();

            // assess
            Assert.True(result.Any());
        }

        [Fact]
        public void SQLRepository_GetFactions_Success()
        {
            // arrange
            var repo = new SqlRepository(configuration);

            // act
            var factions = repo.GetFactions();

            // assess
            Assert.True(factions.Any());
        }

        [Fact]
        public void SQLRepository_GetFactionsByGameId_Success()
        {
            // arrange
            var repo = new SqlRepository(configuration);

            // act
            var factions = repo.GetFactions(1);

            // assess
            Assert.True(factions.Any());
        }

        [Fact]
        public void SQLRepository_GetFactionsByGameId_Fail()
        {
            // arrange
            var repo = new SqlRepository(configuration);

            // act
            var factions = repo.GetFactions(100);

            // assess
            Assert.False(factions.Any());
        }
    }
}
