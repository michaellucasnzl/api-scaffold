FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
USER $APP_UID
WORKDIR /app
EXPOSE 8080
EXPOSE 8081

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["src/ApiScaffold.Web/Web.csproj", "ApiScaffold.Web/"]
COPY ["src/ApiScaffold.Application/ApiScaffold.Application.csproj", "ApiScaffold.Application/"]
COPY ["src/ApiScaffold.Infrastructure/ApiScaffold.Infrastructure.csproj", "ApiScaffold.Infrastructure/"]
COPY ["src/ApiScaffold.Domain/ApiScaffold.Domain.csproj", "ApiScaffold.Domain/"]
RUN dotnet restore "ApiScaffold.Web/ApiScaffold.Web.csproj"
COPY . .
WORKDIR "/src/ApiScaffold.Web"
RUN dotnet build "ApiScaffold.Web.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "ApiScaffold.Web.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "ApiScaffold.Web.dll"]
