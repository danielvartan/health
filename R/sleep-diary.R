tidy_sleep_diary <- function(file) {
    checkmate::assert_file_exists(file)

    ## R CMD Check variable bindings fix (see <https://bit.ly/3z24hbU>)
    timestamp <- bed_time <- bed_date <- get_up_time <- get_up_date <- NULL
    int <- NULL

    # file <- raw_data("sleep_diary", "2021-04-24_2021-05-30_sleep-diary.csv")

    data <- file %>%
        readr::read_csv(na = c("", "NA"),
                        col_names = FALSE,
                        col_types = readr::cols(.default = "c")) %>%
        dplyr::slice(-1) %>%
        dplyr::select(c(1, 8, 10)) %>%
        dplyr::rename_with(function(x) c("timestamp", "bed_time",
                                         "get_up_time")) %>%
        dplyr::mutate(
            timestamp = lubridate::dmy_hms(timestamp),
            bed_time = hms::parse_hms(bed_time),
            get_up_time = hms::parse_hms(get_up_time),
            int = mctq::assign_date(get_up_time, timestamp)) %>%
        ## Remove records made more than 6 hours after waking up.
        dplyr::filter(!hms::hms(as.numeric(int)) > lubridate::dhours(6)) %>%
        dplyr::mutate(
            get_up_date = dplyr::if_else(
                hms::as_hms(timestamp) > get_up_time,
                lubridate::date(timestamp),
                lubridate::date(timestamp) - lubridate::days(1)),
            int = mctq::assign_date(bed_time, get_up_time),
            bed_date = dplyr::if_else(
                lubridate::day(lubridate::int_end(int)) == 1,
                get_up_date,
                get_up_date - lubridate::days(1))) %>%
        dplyr::mutate(
            bed_time =
                lubridate::as_datetime(paste(bed_date, bed_time)),
            get_up_time = lubridate::as_datetime(paste(get_up_date,
                                                       get_up_time))) %>%
        ## Remove records with more than 18h of sleep duration.
        dplyr::filter(!(get_up_time - bed_time) > lubridate::dhours(18)) %>%
        dplyr::select(timestamp, bed_time, get_up_time)
}

actstudio_sleep_diary <- function(data, file_name = NULL) {
    checkmate::assert_data_frame(data, min.rows = 1)
    checkmate::assert_subset(c("bed_time", "get_up_time"), names(data))
    checkmate::assert_string(file_name, null.ok = TRUE)

    ## R CMD Check variable bindings fix (see <https://bit.ly/3z24hbU>)
    bed_time <- get_up_time <- NULL

    out <- data %>%
        dplyr::select(bed_time, get_up_time) %>%
        dplyr::mutate(bed_time = format(bed_time, "%d/%m/%Y %T"),
                      get_up_time = format(get_up_time, "%d/%m/%Y %T")) %>%
        dplyr::rename("BED TIME" = bed_time, "GET UP TIME" = get_up_time)

    if (!is.null(file_name)) {
        file <- paste0("./inst/extdata/actigraphy/", file_name, ".txt")
        readr::write_csv2(out, file, na = "")
        invisible(out)
    } else {
        out
    }
}
