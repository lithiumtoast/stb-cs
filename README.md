# stb-cs

Automatically updated C# bindings for https://github.com/nothings/stb with native dynamic link libraries.

## How to use

### From NuGet package

1. Create a new `nuget.config` file if you don't have one already. Put it beside your `.sln`. If you don't have a `.sln` put it beside your `.csproj`.

```bash
dotnet new nuget
```

2. Add the following NuGet package source to the file.

```xml
<add key="lithiumtoast" value="https://www.myget.org/F/lithiumtoast/api/v3/index.json" />
```

1. Install one the following packages:

- `stb_image-cs`
  
If the stb header is not yet provided open up an issue and I'll add it!

### From source

1. Download and install [.NET 5](https://dotnet.microsoft.com/download).
2. Fork the repository using GitHub or clone the repository manually with submodules: `git clone --recurse-submodules git@github.com:lithiumtoast/stb-cs.git`.
3. Build the native library by running `./library.sh` on macOS or Linux and `.\library.sh` on Windows.

#### Build the existing solution

If using IDE (Visual Studio / Rider): Open `SDL.sln` and build solution.
If using CLI: `dotnet build`.

#### Adding it to your own project

Reference the `.csproj` from your own project. Be sure you built the native library in step #3 before running your application!

```xml
<ItemGroup>
    <ProjectReference Include="path/to/stb-cs/src/cs/production/stb-cs/stb-cs.csproj" />
</ItemGroup>
```

#### Bindgen

If you wish to re-generate the bindings, simple run `./bindgen.sh` on macOS or Linux and `.\bindgen.cmd` on Windows.

## Developers: Documentation

For more information on how C# bindings work, see [`C2CS`](https://github.com/lithiumtoast/c2cs), the tool that generates the bindings for `stb` and other C libraries.

To learn how to use `stb`, check out the [Lazy Foo' Production](https://lazyfoo.net/tutorials/SDL).

## License

`SDL-cs` is licensed under the MIT License (`MIT`) - see the [LICENSE file](LICENSE) for details.

`SDL` itself is public domain or otherwise dualed licensed under MIT (`MIT`) - see https://github.com/nothings/stb/blob/master/LICENSE for more details.
