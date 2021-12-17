# Quick Start for Using DocFx and Companion Tools to generate a Documentation website

If you want an easy way to have a website with all your documentation coming from Markdown files and comments coming from code, you can use [DocFx](https://dotnet.github.io/docfx/). The website generated by DocFx also includes fast search capabilities. There are some gaps in the DocFx solution, but we've provided companion tools that help you fill those gaps. Also see the blog post [Providing quality documentation in your project with DocFx and Companion Tools](https://mtirion.medium.com/providing-quality-documentation-in-your-project-with-docfx-and-companion-tools-76aed42b1ddd) for more explanation about the solution.

## Quick Start

To get you started quickly from scratch, a QuickStart folder is provided to get you started quickly. This way you can focus on the documentation 😁. If you want to get started quickly in your own repo, follow these steps:

1. From the **QuickStart** folder copy these folders and files to your own repo:
   * **DocFx** - pipelines, templates, terraform scripts and webconfig.
   * **x-cross** - a setup to combine documentation and references in one hierarchy.
   * **.markdownlint.json** - a configuration file for *markdownlint*.
   * **docfx.json** - The configuration for DocFx to generate a website and a PDF document
   * **toc.yml** - The TOC definition for the top navigation of the website
   
2. Some **optional** actions:
   
   * **src** - This contains the tools used in the scripts to generate the Table of Contents and checks the links.
     This can best be obtained from [the original repo](https://github.com/Ellerbach/docfx-companion-tools). You can also just download the compiled tools from that repo.
   
   * **.gitignore** - If you don't have a .gitignore yet, you can use this one which is based on a standard .NET Core ignore file. If you already have a .gitignore, please add this part to it, as those folders and files are generated by the process:
   
     ```yaml
     # DocFxQuickStart specials
     docs/toc.yml
     output/
     ```
   
   * **index.md** - this file will be used as the welcome page of the documentation website. You can add specific links that are important to provide direct access.

If you have taken care of the steps above, you can run the **DocFx\GenerateDocs.cmd** command file to generate the website and the PDF documentation. If you want to test the website on your local machine, you can add the **--serve** attribute to start a local web site on **<http://localhost:8080>**. But if you use that parameter, the PDF is *not* generated.

## Create Azure App Service and Publish the Documentation

Now you have the documentation

1. **Azure DevOps:** If you don't have it yet, create a project in Azure DevOps and [create a Service Connection to your Azure environment](https://docs.microsoft.com/en-us/azure/devops/pipelines/library/connect-to-azure?view=azure-devops). Clone the repository.
2. **QuickStart folder:** Copy the contents of the QuickStart folder to the root of your repository.
3. **Azure:** Create a resource group in your Azure environment where the documentation website resources should be created.
4. **Create Azure resources:** Fill in the default values in *infrastructure/variables.tf* and run the commands from [Step 3 - Deploy Azure resources from your local machine](deploy-docfx-azure-website.md#3-deploy-azure-resources-from-your-local-machine) to create the Azure Resources.
7. **Pipeline:** Fill in the variables in *.pipelines/documentation.yml*, commit the changes and push the contents of the repository to your branch (possibly through a PR).
   Now you can create a pipeline in your Azure DevOps project that uses the *.pipelines/documentation.yml* and run it.

This is the result if you publish all the content of the quick start to a website.

![Sample DocFx Website](SampleDocFxWebsite.png)

