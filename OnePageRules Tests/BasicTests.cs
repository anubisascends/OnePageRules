using OnePageRules_WebAPI.Models;

namespace OnePageRules_Tests
{
    public class BasicTests
    {
        [Fact]
        public void Test1()
        {
            var equipment = new Equipment();

            var hash = equipment.GetHashCode();

            equipment.Label = "Hello World";
            equipment.Id = 15;

            var newHash = equipment.GetHashCode();

            Assert.NotEqual(hash, newHash);
        }
    }
}