# GPHS_782_watershed_sci_seminar
Watersheds science seminar code demos for harmonizing various hydrological datasets 

This repository will be used for class examples and short analyses in GPHS 782. The first exercise uses the **modern USGS Water Data APIs** to compare hydrology and water quality across two Lake Tahoe tributaries and the Truckee River.

### Learning goals

By the end of this exercise, you should be able to:

1. Clone a GitHub repository and work from an RStudio Project.
2. Find a USGS monitoring location and inspect which variables are available.
3. Use the USGS `dataRetrieval` R package to query the modern Water Data APIs.
4. Download discharge, water temperature, and turbidity observations.
5. Check data completeness before calculating watershed metrics.
6. Calculate annual streamflow volume and runoff depth for a water year.
7. Compare mean turbidity among watersheds while recognizing differences in record availability.

# I. Getting Started

## 1. Clone the course repository

Repository:

https://github.com/kellyloria/GPHS_782_watershed_sci_seminar.git


1. Open **RStudio**.
2. Select **File → New Project → Version Control → Git**.
3. Paste the repository URL:
   `https://github.com/kellyloria/GPHS_782_watershed_sci_seminar.git`
4. Choose where you want the repository saved.
5. Click **Create Project**.


# II. First week: USGS observational Data: 

http://rpubs.com/kellyloria/1453858

## 2. USGS resources

- **USGS Water Data map, Streamstats:** https://streamstats.usgs.gov/ss/
- **USGS Water Data APIs:** https://www.usgs.gov/tools/usgs-water-data-apis
- **API landing page and download builder:** https://api.waterdata.usgs.gov/
- **`dataRetrieval` R package documentation:** https://water.code-pages.usgs.gov/dataRetrieval/

The USGS is transitioning away from its legacy WaterServices endpoints. For this class, we will use the newer `read_waterdata_*()` functions in `dataRetrieval`, which access the modernized USGS Water Data APIs.

## 3. Candidate monitoring locations

| Watershed / river | USGS monitoring location | Approx. drainage area | Useful continuous variables |
|---|---|---:|---|
| Blackwood Creek near Tahoe City, CA | `USGS-10336660` | 11.2 mi² | discharge, water temperature, turbidity |
| Incline Creek near Crystal Bay, NV | `USGS-10336700` | 6.74 mi² | discharge, water temperature, turbidity |
| Truckee River at Reno, NV | `USGS-10348000` | 1,067 mi² | discharge, turbidity |

**Important:** Monitoring locations do not all measure the same variables over the same periods. The Truckee River at Reno currently has discharge and turbidity but not continuous water temperature. This is intentional in the exercise: always inspect data availability before assuming that a variable exists.

For a nearby Truckee River temperature record, optionally investigate:

- Truckee River at Clark, NV: `USGS-10350500`

## 4. USGS parameter codes

| Variable | USGS parameter code | Typical unit |
|---|---|---|
| Discharge | `00060` | ft³/s |
| Water temperature | `00010` | °C |
| Turbidity | `63680` | FNU |

For daily mean discharge we also request **statistic code `00003`**, which represents the mean.

## 5. Starter file

Open:

`01_USGS_streamflow_waterquality_lab.Rmd`

The R Markdown file walks through finding sites, examining metadata, checking time-series availability, downloading daily discharge and continuous sensor data, calculating annual discharge volume and runoff depth, and comparing turbidity among watersheds.

# III. Second week: Linking streamflow with landcover 

https://rpubs.com/kellyloria/1459961

`01_USGS_flow_landcover_lab.Rmd`

Pull in landcover class datasets from upstream land-cover and geologic characteristics to USGS stream gages and compare them with flow metrics.
