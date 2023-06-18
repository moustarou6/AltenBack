using Alten.Models;

namespace Alten.Repository
{
    public interface IProductsRepository
    {
        ICollection<Product> GetProducts();
        Product GetProduct(int id);

        bool ProductExist(int id);

        bool CreateProduct(string name, string description, string code , string image, int price, string category, int quantity, string inventoryStatus, int rating);
        bool UpdateProduct(Product product);
        bool DeleteProduct(Product product);
        bool Save();

    }
}
