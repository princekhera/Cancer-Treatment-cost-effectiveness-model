# Cancer Treatment Cost-Effectiveness Model (R Shiny)


<p align="center">
  <img src="Cancer_Treatment_Cost_Effectiveness_Model_Demo.gif" width="800">
</p>
## Overview

This project is an interactive **R Shiny application** designed to evaluate the **cost-effectiveness of cancer treatments** using health economic modeling techniques. It allows users to simulate treatment strategies, explore uncertainty, and visualize outcomes such as costs, effectiveness, and incremental cost-effectiveness ratios (ICER).

The app is built to demonstrate core concepts in health economics, including **Markov models, survival analysis, probabilistic sensitivity analysis (PSA), and decision uncertainty**.

---

## Key Features

* **Interactive Markov Model**

  * Simulates disease progression across health states (e.g., PFS, PD, Death)
  * Adjustable transition probabilities

* **Cost-Effectiveness Analysis**

  * Computes total costs and QALYs
  * Calculates ICER for treatment comparisons

* **Probabilistic Sensitivity Analysis (PSA)**

  * Monte Carlo simulations to capture parameter uncertainty
  * Generates distributions of costs and outcomes

* **Cost-Effectiveness Acceptability Curve (CEAC)**

  * Shows probability of cost-effectiveness across willingness-to-pay thresholds

* **Tornado Sensitivity Analysis**

  * Identifies most influential parameters on model outcomes

* **Survival Analysis Integration**

  * Visualizes survival curves used in modeling transitions

---

## Project Structure

```
├── app.R                      # Main Shiny app
├── modules/
│   ├── ui_inputs.R           # Input UI components
│   ├── ui_outputs.R          # Output UI components
│
├── model/
│   ├── markov_model.R        # Core Markov simulation logic
│   ├── icer_calculation.R    # ICER computation
│   ├── psa_simulation.R      # Probabilistic sensitivity analysis
│   ├── tornado_analysis.R    # Tornado sensitivity analysis
│   ├── discount.R            # Discounting functions
│
├── analysis/
│   ├── ceac.R                # CEAC generation
│
├── plots/
│   ├── survival_plot.R       # Survival curve visualization
│
├── README.md                 # Project documentation
```

---

## Installation

### Prerequisites

Make sure you have the following installed:

* R (>= 4.0)
* RStudio (recommended)

### Required Packages

Install dependencies using:

```r
install.packages(c(
  "shiny",
  "ggplot2",
  "dplyr",
  "tidyr",
  "reshape2",
  "data.table"
))
```

---

## Running the App

From the project directory, run:

```r
shiny::runApp()
```

Or open `app.R` in RStudio and click **Run App**.

---

## How to Use

1. **Adjust Inputs**

   * Transition probabilities
   * Costs and utilities
   * Time horizon and discount rate

2. **Run Model**

   * View state transitions and accumulated outcomes

3. **Explore Outputs**

   * ICER results
   * Cost-effectiveness plane
   * CEAC curves
   * Tornado plots

4. **Interpret Results**

   * Assess whether a treatment is cost-effective at a given threshold

---

## Methodology

### Markov Model

* Patients transition between discrete health states over cycles
* Transition probabilities define disease progression

### ICER Calculation

ICER = (Cost_Treatment − Cost_Comparator) / (QALY_Treatment − QALY_Comparator)

### Probabilistic Sensitivity Analysis

* Parameters sampled from probability distributions
* Repeated simulations to assess uncertainty

---

## Use Cases

* Demonstrating health economic modeling concepts
* Teaching cost-effectiveness analysis
* Prototyping decision models for healthcare interventions
* Portfolio projects for data science / health economics roles

---

## Limitations

* Simplified assumptions for demonstration purposes
* Not intended for clinical decision-making without validation
* Model inputs may not reflect real-world data

---

## Author

**Prince Khera**
MSc Health Data Science
Focus: Health Economics, Machine Learning, and Data Analytics
