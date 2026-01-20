FROM mcr.microsoft.com/dotnet/sdk:8.0 AS restore
WORKDIR /src
COPY prtg_exporter.sln ./
COPY src/PrtgExporter.ConsoleApp/*.csproj ./src/PrtgExporter.ConsoleApp/
RUN dotnet restore prtg_exporter.sln
FROM restore AS build
WORKDIR /src
COPY . .
RUN dotnet build prtg_exporter.sln -c Release --no-restore

FROM build AS publish
WORKDIR /src/src/PrtgExporter.ConsoleApp
RUN dotnet publish -c Release --no-build -o /app/publish

FROM mcr.microsoft.com/dotnet/runtime:8.0
WORKDIR /app
COPY --from=publish /app/publish .

ENTRYPOINT ["dotnet", "PrtgExplorer.ConsoleApp.dll"]
