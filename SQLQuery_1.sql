Select *
From CovidDeaths
Where continent IS NOT NULL
Order BY 3 , 4

--Select *
--From  CovidVaccinations
--Order BY 3 , 4

Select Location , date , total_cases , new_cases , total_deaths , population
From PortfolioProject.. CovidDeaths
Order By 1 , 2

--Total Cases Vs Total Death
--(likelihood of dying if you contract covid in your country)

SELECT 
    location, 
    date, 
    total_cases, 
    total_deaths, 
    (CAST(total_deaths AS float) / CAST(total_cases AS float)) * 100 AS DeathPercentage
   
FROM CovidDeaths
Where location Like '%states%'
AND continent IS NOT NULL
ORDER BY 1, 2

--Total cases Vs Population
-- what percent of population got Covid
SELECT 
    location, 
    date, 
    total_cases, 
    population, 
    (CAST(total_cases AS float) / CAST(population AS float)) * 100 AS PercentPopulationInfected
   
FROM CovidDeaths
--Where location Like '%states%'
Where continent IS NOT NULL
ORDER BY 1, 2

-- Countries with Highest Infaction Rate Compared To Population

SELECT 
    location, 
    population,
    MAX(total_cases) AS HighestInfectionCount,
    MAX((total_cases / population)) * 100 AS PercentPopulationInfected
FROM CovidDeaths
 
Where continent IS NOT NULL
GROUP BY location, population   
ORDER BY PercentPopulationInfected DESC

-- Countries With Highest Death Count Per Population
SELECT 
    location, 
    MAX(total_deaths) AS HighestDeathCount     
FROM CovidDeaths
 
Where continent IS NOT NULL
GROUP BY location   
ORDER BY HighestDeathCount DESC

--Break Down by Continent

SELECT 
    continent, 
    MAX(total_deaths) AS HighestDeathCount     
FROM CovidDeaths
 
Where continent IS NOT NULL
GROUP BY continent  
ORDER BY HighestDeathCount DESC


--Countries with Highest Infaction Rate Compared To Population
SELECT 
    continent, 
    MAX(total_deaths) AS HighestDeathCount     
FROM CovidDeaths
 
Where continent IS NOT NULL
GROUP BY continent   
ORDER BY HighestDeathCount DESC

--GLOBAL NUMBER
SELECT 
    --date, 
    SUM(new_cases) AS Total_Cases, 
    SUM(new_deaths) AS Total_Deaths,
    (SUM(CAST(new_deaths AS float)) / NULLIF(SUM(CAST(new_cases AS float)), 0)) * 100 AS DeathPercentage
FROM CovidDeaths
WHERE continent IS NOT NULL
--GROUP BY date
ORDER BY 1, 2


-- Total Population VS Total Vaccinations

SELECT 
    dea.continent, 
    dea.location, 
    dea.date, 
    dea.population, 
    vac.new_vaccinations,
    SUM(CONVERT(bigint, vac.new_vaccinations)) OVER (
        PARTITION BY dea.location 
        ORDER BY dea.location, dea.date 
        ROWS UNBOUNDED PRECEDING
    ) AS RollingPeopleVaccinated
FROM CovidDeaths dea
JOIN CovidVaccinations vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
ORDER BY 2, 3

-- WITH CTE

WITH PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
AS 
(
    SELECT 
        dea.continent, 
        dea.location, 
        dea.date, 
        dea.population, 
        vac.new_vaccinations,
        SUM(CONVERT(bigint, vac.new_vaccinations)) OVER (
            PARTITION BY dea.location 
            ORDER BY dea.location, dea.date 
            ROWS UNBOUNDED PRECEDING
        ) AS RollingPeopleVaccinated
    FROM CovidDeaths dea
    JOIN CovidVaccinations vac
        ON dea.location = vac.location
        AND dea.date = vac.date
    WHERE dea.continent IS NOT NULL
)
SELECT *, (CAST(RollingPeopleVaccinated AS float) / Population) * 100 AS PercentPeopleVaccinated
FROM PopvsVac
ORDER BY Location, Date;

-- TEMP TABLE
USE PortfolioProject;  
GO
DROP TABLE if exists #PercentPopulationVaccinated

Create Table #PercentPopulationVaccinated
(
    Continent nvarchar(255),
    Location nvarchar(255),
    Date datetime,
    Population numeric,
    New_vaccinations numeric,
    RollingPeopleVaccinated numeric
)
Insert into #PercentPopulationVaccinated
SELECT 
    dea.continent,
    dea.location,
    dea.date,
    dea.population,
    vac.new_vaccinations,
    SUM(CAST(vac.new_vaccinations AS bigint)) 
OVER (
    PARTITION BY dea.location 
    ORDER BY dea.date 
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
) AS RollingPeopleVaccinated
FROM CovidDeaths dea
JOIN CovidVaccinations vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL

SELECT * FROM #PercentPopulationVaccinated

-- Creating view To Store Data For LAter Visualization

GO
Create View PercentPopulationVaccinated AS
SELECT 
    dea.continent, 
    dea.location, 
    dea.date, 
    dea.population, 
    vac.new_vaccinations,
    SUM(CONVERT(bigint, vac.new_vaccinations)) OVER (
        PARTITION BY dea.location 
        ORDER BY dea.location, dea.date 
        ROWS UNBOUNDED PRECEDING
    ) AS RollingPeopleVaccinated
FROM PortfolioProject..CovidDeaths dea -- دقت کنید نام دیتابیس درست باشد
JOIN PortfolioProject..CovidVaccinations vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL;
GO
DROP TABLE IF EXISTS #PercentPopulationVaccinated

SELECT * 
FROM PercentPopulationVaccinated
