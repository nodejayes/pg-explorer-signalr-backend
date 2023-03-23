FROM mcr.microsoft.com/dotnet/runtime:7.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["PgExplorerBackend.csproj", "./"]
RUN dotnet restore "PgExplorerBackend.csproj"
COPY . .
WORKDIR "/src/"
RUN dotnet build "PgExplorerBackend.csproj" -c Release -o /app/build

WORKDIR /app/build
COPY ng-jff-ui/dist/client /app/build/client
EXPOSE 5000
ENTRYPOINT ["dotnet", "PgExplorerBackend.dll"]
