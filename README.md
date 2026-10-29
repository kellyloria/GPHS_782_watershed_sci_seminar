# GPHS_782_watershed_sci_seminar
Watersheds science seminar code demos for harmonizing various hydrological datasets 

This repository will be used for class examples and short analyses in GPHS 782. The first exercise uses the **modern USGS Water Data APIs** to compare hydrology and water quality across two Lake Tahoe tributaries and the Truckee River.

# Getting Started

## 1. Clone the course repository

Repository:

https://github.com/kellyloria/GPHS_782_watershed_sci_seminar.git


1. Open **RStudio**.
2. Select **File → New Project → Version Control → Git**.
3. Paste the repository URL:
   `https://github.com/kellyloria/GPHS_782_watershed_sci_seminar.git`
4. Choose where you want the repository saved.
5. Click **Create Project**.


# Lab 1: USGS observational Data: 

http://rpubs.com/kellyloria/1453858

`01_USGS_streamflow_waterquality_lab.Rmd`

### USGS resources

- **USGS Water Data map, Streamstats:** https://streamstats.usgs.gov/ss/
- **USGS Water Data APIs:** https://www.usgs.gov/tools/usgs-water-data-apis
- **API landing page and download builder:** https://api.waterdata.usgs.gov/
- **`dataRetrieval` R package documentation:** https://water.code-pages.usgs.gov/dataRetrieval/

The USGS is transitioning away from its legacy WaterServices endpoints. For this class, we will use the newer `read_waterdata_*()` functions in `dataRetrieval`, which access the modernized USGS Water Data APIs.

### Candidate monitoring locations

| Watershed / river | USGS monitoring location | Approx. drainage area | Useful continuous variables |
|---|---|---:|---|
| Blackwood Creek near Tahoe City, CA | `USGS-10336660` | 11.2 mi² | discharge, water temperature, turbidity |
| Incline Creek near Crystal Bay, NV | `USGS-10336700` | 6.74 mi² | discharge, water temperature, turbidity |
| Truckee River at Reno, NV | `USGS-10348000` | 1,067 mi² | discharge, turbidity |

**Important:** Monitoring locations do not all measure the same variables over the same periods. The Truckee River at Reno currently has discharge and turbidity but not continuous water temperature. This is intentional in the exercise: always inspect data availability before assuming that a variable exists.

For a nearby Truckee River temperature record, optionally investigate:

- Truckee River at Clark, NV: `USGS-10350500`

### USGS parameter codes

| Variable | USGS parameter code | Typical unit |
|---|---|---|
| Discharge | `00060` | ft³/s |
| Water temperature | `00010` | °C |
| Turbidity | `63680` | FNU |

For daily mean discharge we also request **statistic code `00003`**, which represents the mean.


# Lab 2: Linking streamflow with landcover 

https://rpubs.com/kellyloria/1459961

`02_USGS_flow_landcover_lab.Rmd`

This lab demonstrates how to combine USGS streamflow data with upstream watershed characteristics. We will calculate flow metrics for USGS stream gages, assign each gage to a stream reach (COMID), and extract upstream land-cover and geologic characteristics. We will then explore relationships between watershed characteristics and streamflow using data visualization and principal component analysis (PCA).

Pull in landcover class datasets from upstream land-cover and geologic characteristics to USGS stream gages and compare them with flow metrics.


# Lab 3: Exploring vegetation using NASA MODIS satellite data

https://rpubs.com/kellyloria/1471667

`03_AppEEARS_MODIS_NDVI_lab.Rmd`

This lab introduces satellite remote sensing data using NASA's AppEEARS. We will explore how satellite observations can be used to characterize seasonal vegetation greenness across watersheds using the Normalized Difference Vegetation Index (NDVI) and take into account metadata for NDVI observation quality.

