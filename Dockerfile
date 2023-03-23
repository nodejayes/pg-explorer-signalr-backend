FROM mcr.microsoft.com/dotnet/runtime:7.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["BackendTest.csproj", "./"]
RUN dotnet restore "BackendTest.csproj"
COPY . .
WORKDIR "/src/"
RUN dotnet build "BackendTest.csproj" -c Release -o /app/build

WORKDIR /app/build
EXPOSE 5000
ENTRYPOINT ["dotnet", "BackendTest.dll"]
