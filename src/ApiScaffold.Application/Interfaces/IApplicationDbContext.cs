using Microsoft.EntityFrameworkCore;

namespace ApiScaffold.Application.Interfaces;

public interface IApplicationDbContext
{
    DbSet<Manufacturer> Manufacturers { get; }

    Task<int> SaveChangesAsync(CancellationToken cancellationToken);
}
