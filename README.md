**Nova Life Insurance — Project Background**

**Overview**

Nova Life Insurance is an auto insurance provider operating across five states in the United States: California, Oregon, Arizona, Nevada, and Washington. The company serves over 9,000 policyholders across three policy types; Personal Auto, Corporate Auto, and Special Auto delivered through multiple sales channels including Agent, Web, Branch, and Call Centre.

**Problem Statement**

Despite holding a rich dataset spanning customer demographics, policy details, claims history, sales channels, and campaign responses, Nova Life had not applied a structured analytical framework to its renewal campaign data. Without this visibility, the business was allocating campaign budgets without evidence, missing high-value customer segments, and unable to identify which channels, offer types, or demographic profiles were driving the strongest commercial returns.

**Project Objective**

This project delivers a thorough analysis and synthesis of Nova Life's internal campaign data to surface critical, actionable insights that directly support the company's growth and retention strategy. By transforming raw data into clear narratives and evidence-backed recommendations, this project equips Nova Life's leadership with the intelligence needed to run smarter campaigns, protect Customer Lifetime Value, and allocate resources where they generate the highest return.

**Key Areas of Analysis**

1. Campaign Response Analysis: Evaluation of overall and segmented campaign response rates across states, sales channels, coverage types, and renewal offer types — identifying which combinations convert most effectively.
2. Customer Lifetime Value (CLV) Profiling: An analysis of what drives CLV across income bands, education levels, employment status, policy types, and customer tenure — to understand which customer profiles are most commercially valuable.
3. Channel Performance: A comparative evaluation of Agent, Web, Branch, and Call Centre channels across response rate, average CLV, monthly premium, and claim amount — identifying the highest-performing acquisition and retention channels.
4. Demographic & Risk Profiling: An assessment of how gender, marital status, vehicle class, and complaint history relate to response behaviour, premium levels, and total claims paid.
5. Geographic Comparison: A state-level breakdown of customer volume, response rates, total claims, average CLV, and coverage preferences across all five operational states.

**Data Structure & Initial Checks**

Nova Life's dataset consists of a single Marketing table containing 9,134 customer records. Before analysis, the data was cleaned using SQL removing duplicates, standardising inconsistent values across Response, Gender, Marital Status, Vehicle Size, and Sales Channel fields, and trimming whitespace from State entries. A clean version of the table was saved as Marketing_Clean for all downstream analysis.

Download the full SQL file containing data cleaning and analysis queries:

[⬇️ Download Insurance_Campaign.sql](https://github.com/MelodyNwaonusuru/Insurance_Campaign/raw/main/Insurance_Campaign.sql)

**Executive Summary — Executive & Financial Overview**

1. Nova Life holds 9,134 customers with an average Customer Lifetime Value of $8,005, a campaign response rate of 14.32%, and $3.96M in total claims paid across the portfolio.
2. The Agent channel leads all others in both CLV and response rate, establishing itself as Nova Life's most commercially productive acquisition and retention channel by a clear margin.
3. Renewal Offer Type 2 generates the highest campaign response rate among all offer formats, pointing to a significant opportunity to standardise campaign structure around this proven approach.
4. Customers who responded Yes to the campaign hold a marginally higher average CLV ($8,030) than non-responders ($7,985), confirming that responsive customers are also the company's most valuable long-term segment.
5. California is Nova Life's largest market with 3,150 customers but also carries the highest total claims burden, making it a market that demands both volume investment and careful cost management.

Below is the Executive Overview page from the Power BI dashboard, and more examples are included throughout the report.
Show Image


**Insight Deep Dive — Campaign & Response Analytics**

**Key Findings**

1. The overall campaign response rate stands at 14.32%, with 1,308 customers out of 9,134 responding positively — a baseline that highlights both the scale of non-response and the opportunity to improve targeting precision.
2. Renewal Offer Type 2 drives the highest response rate across all offer types, making it the single most effective campaign format in Nova Life's current toolkit and the clearest candidate for broader rollout.
3. The Agent channel delivers the strongest response rate and highest average CLV among all sales channels, confirming that human-led, relationship-based outreach significantly outperforms self-service and digital alternatives.
4. Basic policyholders account for the highest volume of campaign responses (798), followed by Extended (390) and Premium (120), suggesting that mid-tier customers are the most engaged and reachable segment for renewal campaigns.
5. Response rate is nearly equal between male (50.46%) and female (49.54%) customers, indicating that gender alone is not a reliable campaign targeting variable and that demographic precision should focus on other attributes.

Show Image

**Insight Deep Dive — Customer Demographics & Risk Profile**

**Key Findings**

1. Married customers account for 53.21% of all campaign responses, far outpacing divorced (24.77%) and single (22.02%) segments — making marital status one of the strongest demographic predictors of campaign receptiveness in the Nova Life customer base.
2. The Middle income band produces the highest average CLV at $8.3K, slightly ahead of the Upper Middle band at $8.2K, while No Income customers record the lowest CLV at $7.6K — providing a clear income-based segmentation framework for campaign prioritisation.
3. Luxury SUV and Luxury Car holders generate the highest average monthly premiums by vehicle class, significantly outpacing standard vehicle categories and identifying a high-value segment worth dedicated retention investment.
4. Customers with a High School or Below education record the highest average CLV at $8.3K, while Doctor-level education holders show the lowest at $7.52K — a counterintuitive finding that likely reflects policy type and vehicle class composition within each education group.
5. The 3–5 year tenure band holds the highest average CLV at $8.2K, suggesting that mid-tenure customers represent Nova Life's sweet spot — experienced enough to hold valuable policies, but not yet at the attrition risk that longer-tenured segments can carry.
6. Customers with open complaints do not show a clear linear relationship with claim amounts — indicating that complaint volume alone is not a reliable predictor of claims cost and should not be used as the primary risk-screening variable.

Show Image

**Recommendations**

**Strategic Priorities**

1. Standardise renewal campaigns around Offer Type 2: this offer format outperforms all others in conversion rate; Nova Life should retire or restructure underperforming offer types and redirect campaign budget toward the format that is already proven to work
2. Invest disproportionately in the Agent channel — with the highest response rate and average CLV among all channels, the Agent network is Nova Life's most commercially effective distribution asset; scaling agent capacity, improving agent tooling, and incentivising agent-led renewals should be a near-term operational priority
3. Prioritise married, middle-income customers as the primary campaign segment — this cohort consistently demonstrates the highest response rates and strongest CLV; campaign messaging, timing, and offer design should be optimised specifically for this profile before broader audience targeting is attempted
4. Build a dedicated Luxury vehicle retention programme — Luxury SUV and Luxury Car holders generate premium revenue multiples above the portfolio average; a targeted loyalty track with proactive renewal outreach and exclusive policy enhancements would protect and grow this high-value segment
5. Review California's cost-to-serve model — as both the largest state by customer volume and the highest total claims market, California's net commercial contribution requires a dedicated profitability review before further volume growth is pursued there
6. Develop a mid-tenure intervention strategy — the 3–5 year tenure band holds the highest CLV; a structured engagement programme at the 3-year mark, designed to deepen policy coverage and reinforce loyalty, could extend customer lifetime and increase average revenue per policy
7. Investigate the Web and Branch channel underperformance — both channels show materially weaker response rates and CLV than the Agent channel; a channel audit should determine whether poor performance reflects audience quality, offer structure, or execution gaps — and whether budget should be reallocated accordingly
8. Use income band and vehicle class as primary segmentation variables — the data shows consistent CLV differentiation across both dimensions; Nova Life's campaign personalisation and underwriting strategy should be rebuilt around these two variables as the primary targeting framework

These recommendations are drawn directly from the data and are designed to be actionable within a short execution window. The focus is on quick wins that protect CLV, concentrate budget in the highest-converting segments, and double down on what the data has already confirmed is working.

**Tools Used**

**Tool Purpose **

1. SQL Server (T-SQL)Data cleaning — duplicate removal, column standardisation, null handling, and exploratory data analysis queries
2. Power BI Desktop: Data modelling, DAX measure development, dashboard design and layout across three report pages
3. Power Query (M): Data transformation, column structuring, and data type enforcement before model load
4. DAX KPI measures — Campaign Response Rate %, Average CLV, Average Customer Tenure, CLV by Tenure Band, and conditional formatting logic
5. Star Schema Modelling: Structured the data model with a central fact table and dimension tables for clean cross-filtering across demographics, geography, channel, and policy
