using Microsoft.AspNetCore.Mvc.Versioning;
using OnePageRules_WebAPI.Repositories;
using OnePageRules_WebAPI.Repositories.Interfaces;
using Serilog;

var builder = WebApplication.CreateBuilder(args);
    

// add logging
var logger = new LoggerConfiguration()
    .ReadFrom.Configuration(builder.Configuration)
    .Enrich.FromLogContext()
    .CreateLogger();
builder.Logging.ClearProviders();
builder.Logging.AddSerilog(logger);


// Add services to the container
builder.Services.AddTransient<IGameRepository, GameSqlRepository>();
builder.Services.AddTransient<IFactionRepository, FactionSqlRepository>();
builder.Services.AddTransient<IEquipmentRepository, EquipmentSqlRepository>();

builder.Services.AddControllers();
builder.Services.AddApiVersioning();

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
