# QuickStart

Below a description of the files and folders in the Quick Start folder.

```xaml
📂QuickStart // root
  📂docs // documentation root
    📂.attachments // images and other attachments
    📂.docfx // docfx configuration files
      📂template // docfx template for website
      📂x-cross // cross reference configuration
    📂general // Sample general documentation
    📂images // root images for favicon.ico and logo.png
    📂services // Sample service documentation
    📄.order // for ADO and TocGenerator. Determines order of files in a folder.
    📄docfx.json // configuration of DocFx input and output
    📄index.md // root document of the website
    📄toc.yml // configuration of the top navigation of the website
    📄web.config // IIS configuration
  📂src // Sample sources
    📂build // Shared compiler configuration settings
    📂DotNetCoreSampleWebAPI // Sample .NET web api 
    📄Directory.Build.props // Force settings in all child solutions/projects
    📄index.md // documentation
  📄.markdownlint.json // Configuration file for markdownlint tool
  📄GenerateDocWebsite.cmd // Batchfile for running generation
```

