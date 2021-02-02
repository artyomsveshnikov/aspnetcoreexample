FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
WORKDIR /app
EXPOSE 443
EXPOSE 80

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS publish
WORKDIR /srcserver
COPY . .
ARG VERSION=7.7.7
ENV BACK_VERSION=${VERSION}
RUN dotnet publish -o /app/publish example/example.csproj  -p:Version=${BACK_VERSION} -r linux-x64 && ls -la /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENV PATH=$PATH:/app
ENTRYPOINT ["example"]

