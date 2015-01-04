# TeamCity Configuration

## Installing TeamCity

- Install MySQL
    - Open command prompt
        - mysql -u root
            - create database teamcity;
            - exit
        - exit
 - Install TeamCity
    - Accept defaults except:
        - Run TeamCity Server under the SYSTEM account
        - Run TeamCity Agent under the SYSTEM account
- Initial TeamCity configuration
    - First time you open TeamCity website **http://localhost/** then complete the configuration screens:
        - Select MySQL database
        - Follow link to download & install JDBC driver
        - Copy "C:\Program Files (x86)\MySQL\MySQL Connector J" to "C:\ProgramData\JetBrains\TeamCity\lib\jdbc"
        - Database name: teamcity
        - User name: root
        - Password: <<empty>>
- Configure NuGet for TeamCity
    - Open **http://localhost/admin/admin.html?item=nugetServerSettingsTab&nuget-section=nuget-exe**.
    - Click **Fetch NuGet** button.

## Additional Packages

- Copy **C:\Program Files (x86)\MSBuild\Microsoft\VisualStudio\v12.0\WebApplications** from developer machine to build server.

## Add croquetscores.com

- Go to **http://localhost/overview.html**.
- Click **Create project from URL**.
- Complete **Create Project From URL** forms.
- Add **NuGet Install** build step for "croquetscores.com.sln". (Will take several minutes before "Auto-detected Build Steps" because the git repository has to be downloaded first.)
- Edit **NuGet build step**.
    - Add **https://nuget.org/api/v2/** to package sources. NOTE: Web page suggests this is not required but it is.
    - Add **https://www.myget.org/F/timpmurphy/** to package sources.
    - TODO: Add NuGet.config with package sources to solution root folder.
- Add **VCS Trigger**.
- Add **Visual Studio (sln)** build step.
- todo: Instructions for branch specifications



- Run the build


