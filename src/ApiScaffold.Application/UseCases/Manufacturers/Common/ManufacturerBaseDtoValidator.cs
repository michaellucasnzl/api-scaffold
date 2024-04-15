namespace ApiScaffold.Application.UseCases.Manufacturers.Common;

public class ManufacturerBaseDtoValidator : AbstractValidator<ManufacturerBaseDto>
{
    public ManufacturerBaseDtoValidator()
    {
        RuleFor(x => x.Name).NotEmpty();
    }
}