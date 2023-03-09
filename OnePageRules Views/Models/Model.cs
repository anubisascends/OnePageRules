using CommunityToolkit.Mvvm.ComponentModel;
using System.ComponentModel;
using System.Windows;

namespace OnePageRules.Views.Models
{
    [ObservableObject]
    public abstract partial class Model
    {
        public abstract void Show();
        public abstract bool? ShowDialog();
    }

    public abstract class Model<T> : Model where T: Window, new()
    {
        public T? CurrentView { get; private set; }

        public override void Show()
        {
            CurrentView = new T();
            CurrentView.DataContext = this;
            CurrentView.Show();
        }

        public override bool? ShowDialog()
        {
            CurrentView = new T();
            CurrentView.DataContext = this;
            return CurrentView.ShowDialog();
        }
    }
}
