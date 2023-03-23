using BackendTest.Hubs;
using Microsoft.AspNetCore.SignalR;

var builder = WebApplication.CreateBuilder(new WebApplicationOptions{
    WebRootPath = "client"
});
builder.Services.AddSignalR().AddMessagePackProtocol();
builder.Services.AddCors(o =>
{
    o.AddDefaultPolicy(b =>
    {
        b.WithOrigins("http://localhost:4200").AllowAnyHeader().WithMethods("GET", "POST").AllowCredentials();
    });
});
var app = builder.Build();
app.UseCors();
app.UseDefaultFiles();
app.UseStaticFiles();
app.MapHub<ChatHub>("/chatHub");
app.Run("http://0.0.0.0:5000");