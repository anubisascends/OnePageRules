using OnePageRules.Views.Models;
using System.Windows;

namespace OnePageRules
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        protected override void OnStartup(StartupEventArgs e)
        {
            var model = new RootViewModel();

            model.Show();
        }
    }
}
