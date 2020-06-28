FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /src
COPY ["TraefikTest.csproj", "./"]
RUN dotnet restore "./TraefikTest.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "TraefikTest.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "TraefikTest.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "TraefikTest.dll"]
