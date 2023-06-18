using Alten.Data;
using Alten.Models;

namespace Alten.Repository
{
    public class ProductsRepository: IProductsRepository
    {
        private readonly DataContext _context;

        public ProductsRepository(DataContext context)
        {
            _context = context;
        }

        public bool CreateProduct(string name, string description, string code, string image, int price, string category,int quantity, string inventoryStatus, int rating)
        {
            var product = new Product { Name = name, Description = description,  Code = code, Image = image, Price = price, Category = category, Quantity= quantity, InventoryStatus = inventoryStatus, Rating = rating };
            _context.Add(product); 
            return Save();
        }

        public bool ProductExist(int id)
        {
            return _context.Products.Any(p => p.Id == id);
        }

        public Product GetProduct(int id)
        {          
            return _context.Products.Where(x => x.Id == id).FirstOrDefault();
        }

        /* public Product GetProductById(int id)
         {
             return _context.Products.Find(x => x.Id == id);
         }*/
        public ICollection<Product> GetProducts()
        {
            return _context.Products.ToList();
        }        

        public bool Save()
        {
            var saved =  _context.SaveChanges();
            return saved > 0 ? true : false;
        }

        public bool UpdateProduct(Product product)
        {
            _context.Update(product);
            return Save();
        }

        public bool DeleteProduct(Product product)
        {
            _context.Remove(product);
            return Save();
        }
    }
}
