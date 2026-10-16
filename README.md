# Film Box Office Performance | Commercial Analysis

## Project Overview

This independent portfolio project explores the commercial performance of films using the TMDB 5000 Movie Dataset. I used SQL Server to investigate film revenue, production budgets, audience ratings, release trends, original language and genre, before creating an interactive dashboard in Tableau Public.

The aim was to practise analysing commercial data, identifying trends and considering how insights could support decision-making in the film distribution industry.

## Tools Used

- **SQL Server:** Data exploration, filtering, aggregation and analysis using SQL queries, including `GROUP BY`, `CASE` statements and `OPENJSON`.
- **Tableau Public:** Data visualisation and dashboard development.
- **Excel/CSV:** Data preparation and importing datasets.

## Interactive Dashboard

[Explore the interactive Tableau dashboard](https://public.tableau.com/app/profile/sofia.shah7982/viz/FilmBoxOfficePerformanceCommercialAnalysis/MediaandTVBoxOffice)

![Film Box Office Performance Dashboard](Media%20and%20TV%20%28Box%20Office%29.png)

## Key Findings & Commercial Insights

### 1. Audience Ratings and Revenue

Films with audience ratings of 7 and above generated approximately **$179 million in average box-office revenue**, compared with approximately **$61 million** for films rated below 5 in the filtered dataset.

**Commercial insight:** Audience reception may be a useful indicator to consider when reviewing film performance. For a distributor, combining ratings with historical sales data could help identify titles worth highlighting in catalogue promotions. However, this relationship does not establish that higher ratings cause higher revenue.

### 2. Production Budgets and Revenue

The analysis identified a general positive relationship between production budgets and box-office revenue, although performance varied significantly between individual films.

Major blockbusters such as *Avatar* demonstrate how certain titles can achieve exceptional commercial success compared with the wider market.

**Commercial insight:** Production budget alone is unlikely to provide a reliable revenue forecast. Franchise recognition, audience demand, genre and release strategy may also influence performance. Exceptional blockbuster results should be considered when interpreting averages and developing forecasts.

### 3. Original Language and International Film Opportunities

English-language films recorded the highest average box-office revenue among the displayed language groups, at approximately **$121 million per film**. Japanese- and Chinese-language films also showed relatively strong average performance, at approximately **$81 million and $80 million**, respectively.

**Commercial insight:** These findings raise interesting questions about opportunities for international films, particularly East Asian titles. Further analysis of audience preferences, territory-level demand and digital sales could help distributors identify opportunities for international film promotions.

Original language does not indicate where a film earned its revenue, so these results cannot establish demand within any particular EMEA market.

### 4. Genre Performance

Animation, Adventure and Fantasy were among the highest-performing genres by average box-office revenue. Animation generated approximately **$277 million per film** in the analysed sample.

**Commercial insight:** Genre could be a useful factor when reviewing title performance and planning promotional activity. Combining genre with budget, audience ratings and historical sales could provide a more complete understanding of commercial potential.

### 5. Release-Year Trends

Average box-office revenue generally increased across the selected historical period, although results fluctuated between individual years.

**Commercial insight:** Historical trends can provide useful context for performance reporting and forecasting, but changes in the dataset's film composition and coverage mean the results should not be interpreted as a definitive measure of industry-wide growth.

## Data Limitations

- The dataset contains reported **box-office revenue**, not digital rental or purchase revenue.
- Production budget is not the same as total film cost, so revenue-to-budget comparisons do not measure profit.
- The dataset is not necessarily representative of all films or markets.
- Some films have missing or zero-valued financial information, which affects the analysed sample.
- Films may belong to multiple genres, meaning genre categories overlap.
- Original language does not identify the territories in which revenue was generated.

## Project Files

- `01_create_tables.sql` — Database setup and data import.
- `02_Data_Exploration.sql` — Initial exploration and data-quality checks.
- `03_commercial_analysis.sql` — Commercial performance analysis using SQL.

## Conclusion

This project helped me develop my SQL and Tableau skills while exploring how commercial data can be used to understand film performance.

Although the dataset focuses on theatrical box-office results rather than transactional home entertainment sales, the analytical approach could be adapted to explore digital purchases, rentals, promotional effectiveness and title performance across different markets.
