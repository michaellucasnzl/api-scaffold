
namespace ApiScaffold.Application.UseCases.Manufacturers.Common;

public class ManufacturerBaseDto
{
    public Guid? Id { get; set; }
    public required string Name { get; set; }
    
    private class Mapping : Profile
    {
        public Mapping()
        {
            CreateMap<Manufacturer, ManufacturerBaseDto>();
        }
    }
}