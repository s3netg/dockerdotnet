# Stage 1
FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine AS build  
WORKDIR /build
COPY . .
RUN dotnet restore
RUN dotnet publish -c Release -o /app
# Stage 2
FROM mcr.microsoft.com/dotnet/aspnet:5.0-alpine AS base  
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "exemplo.dll"]