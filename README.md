# LuxAptPrice: Quarterly Apartment Sale Price Analysis in Luxembourg

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

This repository contains R code and data for analyzing quarterly apartment sale prices in Luxembourg, broken down by commune. The analysis focuses on time series forecasting to predict future price trends. This repository contains the code for the [LuxAptPrice](https://christos.shinyapps.io/luxaptprice/) web application.

## Data Source

The data used in this project is obtained from [data.public.lu](https://data.public.lu/en/datasets/prix-de-vente-des-appartements-par-commune/), specifically the "Prix de vente des appartements par commune" dataset.

## Getting Started

1.  **Clone the repository:**

    ``` bash
    git clone [https://github.com/cavrilionis/LuxAptPrice.git](https://github.com/cavrilionis/LuxAptPrice.git)
    cd LuxAptPrice
    ```

2.  **Install required R packages:**

    Open R or RStudio and run the following:

    ``` r
    install.packages(readLines("requirements.txt"))
    ```

3.  **Run the analysis:**

    Execute the R scripts in the `R/` directory in the following order:

    ``` r
    source("R/download.R")
    source("R/read.R")
    source("R/analyse.R")
    ```

    The results, including forecasts and visualizations, will be saved in the `results/` directory.

## Analysis Overview

-   **Data download (`R/download.R`):** This script downloads the raw data from [data.public.lu](https://data.public.lu/en/datasets/prix-de-vente-des-appartements-par-commune/). The downloaded Excel files are saved in the `data/` directory.

-   **Data processing (`R/read.R`):** This script reads the Excel files and appends them into a `tsibble`.

-   **Time Series Analysis (`R/analyse.R`):** This script performs time series forecasting using the `fable` package. It applies appropriate models (e.g., ARIMA, ETS) to predict future apartment sale prices for each commune.

-   **Visualisations (`R/visualisations.R`):** This script generates visualizations using `ggplot2` and `fabletools` to illustrate historical trends and forecast results.

## Key Features

-   Quarterly apartment sale price analysis by commune.
-   Time series forecasting for price prediction.
-   Data visualizations for trend analysis.
-   Clear and well-documented R code.

## Contributing

Contributions are welcome! Please follow the [Contributing Guidelines](CONTRIBUTING.md).

## License

This project is licensed under the [MIT License](LICENSE).

## Contact

For questions or issues, please open an issue on GitHub.
