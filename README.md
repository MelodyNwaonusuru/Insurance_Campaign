**Nova Life Insurance — Project Background**

**Overview**

Nova Life Insurance is an auto insurance provider operating across five states in the United States: California, Oregon, Arizona, Nevada, and Washington. The company serves over 9,000 policyholders across three policy types — Personal Auto, Corporate Auto, and Special Auto — delivered through multiple sales channels including Agent, Web, Branch, and Call Centre.

**Problem Statement**

Despite holding a rich dataset spanning customer demographics, policy details, claims history, sales channels, and campaign responses, Nova Life had not applied a structured analytical framework to its renewal campaign data. Without this visibility, the business was allocating campaign budgets without evidence, missing high-value customer segments, and unable to identify which channels, offer types, or demographic profiles were driving the strongest commercial returns.

**Project Objective**

This project delivers a thorough analysis and synthesis of Nova Life's internal campaign data to surface critical, actionable insights that directly support the company's growth and retention strategy. By transforming raw data into clear narratives and evidence-backed recommendations, this project equips Nova Life's leadership with the intelligence needed to run smarter campaigns, protect Customer Lifetime Value, and allocate resources where they generate the highest return.

**Key Areas of Analysis**

1. Campaign Response Analysis: Evaluation of overall and segmented campaign response rates across states, sales channels, coverage types, and renewal offer types identifying which combinations convert most effectively.
2. Customer Lifetime Value (CLV) Profiling: An analysis of what drives CLV across income bands, education levels, employment status, policy types, and customer tenure to understand which customer profiles are most commercially valuable.
3. Channel Performance: A comparative evaluation of Agent, Web, Branch, and Call Centre channels across response rate, average CLV, monthly premium, and claim amount identifying the highest-performing acquisition and retention channels.
4. Demographic & Risk Profiling: An assessment of how gender, marital status, vehicle class, and complaint history relate to response behaviour, premium levels, and total claims paid.
5. Geographic Comparison: A state-level breakdown of customer volume, response rates, total claims, average CLV, and coverage preferences across all five operational states.

**Data Structure & Initial Checks**

Nova Life's dataset consists of a single Marketing table containing 9,134 customer records. Before analysis, the data was cleaned using SQL removing duplicates, standardising inconsistent values across Response, Gender, Marital Status, Vehicle Size, and Sales Channel fields, and trimming whitespace from State entries. A clean version of the table was saved as Marketing_Clean for all downstream analysis.

Download the full SQL file containing data cleaning and analysis queries:

[⬇️ Download Insurance_Campaign.sql](https://github.com/MelodyNwaonusuru/Insurance_Campaign/raw/main/Insurance_Campaign.sql)


**Executive Summary — Executive & Financial Overview**

1. Nova Life manages 9,134 customers with an average monthly revenue of $93.22 per customer, an average Customer Lifetime Value of $8,005, a campaign response rate of 14.32%, and $3.96M in total claims paid across the portfolio.

2. Personal Auto is by far the dominant policy type, accounting for approximately 6,800 customers nearly 74% of the total portfolio with Corporate Auto holding around 2,000 customers and Special Auto representing a small segment of approximately 400.

3. The customer base is nearly evenly split by gender at 51% male and 49% female, indicating no significant gender skew in Nova Life's acquisition reach.

4. The Middle income band is the single largest customer segment at 2,433 customers, followed closely by No Income at 2,317 and Upper Middle at 2,002. The High income tier is the smallest segment at just 479 customers, representing a significant untapped premium opportunity.

5. California is Nova Life's largest market with 3,150 customers, followed by Oregon at 2,601, Arizona at 1,703, Nevada at 882, and Washington at 798 with the top two states together accounting for more than 63% of the entire customer base.

6. Customers who responded positively to the campaign hold a slightly higher share of average CLV (50.55%) compared to non-responders (49.45%), confirming that responsive customers are marginally but consistently more commercially valuable over their lifetime.

7. The Agent channel leads all others in both CLV and response rate, establishing itself as Nova Life's most commercially productive acquisition and retention channel by a clear margin.

Below is the Executive Overview page from the Power BI dashboard, and more examples are included throughout the report.
Show Image


**Insight Deep Dive — Campaign & Response Analytics**

**Key Findings**

1. The overall campaign response rate stands at 14.32%, with 1,308 customers out of 9,134 responding positively a baseline that highlights both the scale of non-response and the significant opportunity to improve targeting precision across all channels.

2. Renewal Offer Type 2 drives the highest response rate across all offer types, making it the single most effective campaign format in Nova Life's current toolkit and the clearest candidate for broader, standardised rollout.

3. The Agent channel delivers the strongest response rate among all sales channels visibly separated from the cluster of Web, Branch, and Call Centre on the CLV-versus-response-rate scatter chart confirming that human-led, relationship-based outreach significantly outperforms self-service and digital alternatives in both conversion and long-term value generation.

4. Web, Branch, and Call Centre channels all cluster tightly in the lower-right of the scatter plot at response rates broadly in the 12–13% range, suggesting their underperformance relative to Agent is structural rather than individual, and that a shared channel-level audit may be warranted.

5. Basic policyholders account for the highest volume of campaign responses at 798, followed by Extended at 390 and Premium at 120 suggesting that mid-tier customers are the most engaged and reachable segment for renewal campaigns, while Premium holders, despite their higher commercial value, respond at the lowest absolute rate.

6. Response rate is almost perfectly equal between female (50.46%) and male (49.54%) customers, indicating that gender alone is not a reliable campaign targeting variable and that demographic precision should focus on other attributes such as income band, tenure, and marital status.

7. The average customer tenure across the portfolio sits at 48.06 months approximately four years indicating a reasonably mature customer base with meaningful long-term relationship data available for segmentation and intervention design.

8. CLV by tenure band peaks in the 3–5 year cohort at $8,175, dips in the 1–3 year band to $7,875 (the lowest across all tenure groups), recovers in the 5+ year band to $8,002, and the 0–1 year cohort sits at $7,921 suggesting that the early-to-mid relationship phase (1–3 years) represents a vulnerability window where customer value has not yet fully matured and proactive engagement is most critical.

9. The Middle income band generates the highest average CLV at $8,308, followed by Upper Middle at $8,219. The No Income segment records the lowest CLV at $7,636, while the High income tier sits at $7,796 a counterintuitive result that likely reflects policy type composition within that cohort, and warrants further investigation before assuming high earners are naturally high-value insurance customers.

Show Image


**Insight Deep Dive — Customer Demographics & Risk Profile**

**Key Findings**

1. The average household income across Nova Life's customer base is $37.66K, with a total of 27,090 policies managed across the portfolio and an average of 15 months since last claim indicating a moderately active claims environment with claim activity on average just over a year in the past.

2. Married customers account for 53.21% of all campaign responses, far outpacing divorced (24.77%) and single (22.02%) segments making marital status one of the strongest demographic predictors of campaign receptiveness in the Nova Life customer base and a primary targeting variable for future campaign design.

3. The Middle income band again produces the highest average CLV at $8.3K in the demographics view, consistent with the campaign analytics findings, with Upper Middle at $8.2K close behind. The No Income segment records the lowest CLV at $7.6K, providing a clear income-based segmentation framework for campaign prioritisation and underwriting strategy.

4. Luxury SUV holders generate the highest average monthly revenue at $213.18, followed almost exactly by Luxury Car holders at $212.12 both approximately 75% higher than Sports Car ($121.88) and SUV ($120.16) holders, and nearly three times the revenue generated by Four-Door Car ($77.42) and Two-Door Car ($76.93) customers. This gap identifies Luxury vehicle holders as a disproportionately high-value retention segment.

5. The education-based CLV analysis reveals a counterintuitive pattern: customers with a High School or Below education record the highest average CLV at $8.3K, while Master's holders sit at $8.24K, Bachelors at $7.87K, College at $7.85K, and Doctor-level education holders record the lowest CLV at $7.52K. This inversion likely reflects differences in policy type and vehicle class composition across education groups, and suggests that education should not be used as a proxy for customer value without controlling for those confounding factors.

6. The treemap layout of CLV by education also visually confirms that the High School or Below and Master's groups represent the largest and second-largest customer volumes respectively meaning Nova Life's highest-CLV segments also carry meaningful scale, not just average value.

7. Customers with open complaints do not show a clear linear relationship with claim amounts, indicating that complaint volume alone is not a reliable predictor of claims cost and should not be used as the primary risk-screening variable in either underwriting or customer management decisions.

8. Response rate remains virtually equal between male and female customers at 50.46% female versus 49.54% male confirming across both the Campaign Analytics and Demographics pages that gender holds no material predictive power for campaign targeting and should be deprioritised in segmentation models.

Show Image

**Recommendations**

**Strategic Priorities**

1. Standardise renewal campaigns around Offer Type 2: this offer format outperforms all others in conversion rate; Nova Life should retire or restructure underperforming offer types and redirect campaign budget toward the format that is already proven to work.

2. Invest disproportionately in the Agent channel : with the highest response rate and average CLV among all channels, the Agent network is Nova Life's most commercially effective distribution asset; scaling agent capacity, improving agent tooling, and incentivising agent-led renewals should be a near-term operational priority.

3. Prioritise married, middle-income customers as the primary campaign segment : this cohort consistently demonstrates the highest response rates and strongest CLV; campaign messaging, timing, and offer design should be optimised specifically for this profile before broader audience targeting is attempted.

4. Build a dedicated Luxury vehicle retention programme : Luxury SUV and Luxury Car holders generate monthly revenue multiples roughly 75% above mid-tier vehicle categories and nearly three times standard vehicle segments; a targeted loyalty track with proactive renewal outreach and exclusive policy enhancements would protect and grow this high-value segment.

5. Design a 1–3 year tenure intervention strategy : this tenure band records the lowest CLV across all cohorts at $7,875; a structured early-relationship engagement programme between months 12 and 36 could close the gap with the peak 3–5 year cohort and prevent early-stage attrition before it erodes lifetime value.

6. Investigate the Web and Branch channel underperformance : both channels show materially weaker response rates than the Agent channel and cluster together with Call Centre in the lower performance band; a channel audit should determine whether poor performance reflects audience quality, offer structure, or execution gaps and whether budget should be reallocated accordingly.

7. Review California's cost-to-serve model : as both the largest state by customer volume and the highest total claims market, California's net commercial contribution requires a dedicated profitability review before further volume growth is pursued there.

8. Use income band, vehicle class, and marital status as the primary segmentation variables : the data shows consistent CLV and response rate differentiation across all three dimensions; Nova Life's campaign personalisation and underwriting strategy should be rebuilt around these as the primary targeting framework, with education used only in conjunction with policy type to avoid misreading the counterintuitive CLV pattern by education level.

9. Investigate Premium policyholder campaign engagement : Premium customers record the lowest absolute response volume at 120 despite representing a high-value segment; a dedicated Premium retention track with differentiated outreach distinct from the general campaign may unlock response uplift from the cohort with the highest per-customer revenue potential.

10. Explore the High income CLV gap with a CLV of $7,796, High income customers underperform Middle and Upper Middle segments despite their earnings profile; understanding whether this reflects lower policy coverage, shorter tenure, or channel mismatch could unlock a significant upgrade and cross-sell opportunity in this segment.

These recommendations are drawn directly from the data across all three dashboard pages and are designed to be actionable within a short execution window. The focus is on quick wins that protect CLV, concentrate budget in the highest-converting segments, and double down on what the data has already confirmed is working.

**Tools Used**

1. SQL Server (T-SQL) — data cleaning covering duplicate removal, column standardisation, null handling, and exploratory data analysis queries
2. Power BI Desktop — data modelling, DAX measure development, and dashboard design across three report pages
3. Power Query (M) — data transformation, column structuring, and data type enforcement before model load
4. DAX — KPI measures including Campaign Response Rate %, Average CLV, Average Customer Tenure, CLV by Tenure Band, Average Monthly Revenue by Vehicle Class, and conditional formatting logic
